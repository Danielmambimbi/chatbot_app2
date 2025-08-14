import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.pipeline import Pipeline
from sklearn.svm import LinearSVC
import random
from flask import Flask, request,render_template,jsonify
from flask_cors import CORS
import os
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np
from sentence_transformers import SentenceTransformer
from sklearn.metrics import classification_report, accuracy_score
import joblib
import mysql.connector
import spacy

# Charger le modèle de langue français de spaCy
nlp = spacy.load("fr_core_news_sm")

def search_product(message):
    msg = message.lower()

    # Liste de mots génériques pour déclencher une réponse générale
    mots_generiques = ["produit", "produits", "article", "articles", "marchandise", "marchandises", "vêtement", "vêtements", "bien", "biens", "objet", "objets"]

    # Connexion à la base MySQL
    def search_product_by_keyword(keyword):
        try:
            conn = mysql.connector.connect(
            host="mysql-danielmambimbi.alwaysdata.net",
            user="417759_ecom1",  # Remplace par ton utilisateur MySQL
            password="0896966760",  # Mets ton mot de passe MySQL
            database="danielmambimbi_ecommerce1",
            port=3306
            )
            cursor = conn.cursor()
            query = "SELECT nom, prix FROM produits WHERE nom LIKE %s LIMIT 3"
            cursor.execute(query, (f"%{keyword}%",))
            results = cursor.fetchall()
            cursor.close()
            conn.close()
            return results
        except Exception as e:
            print("Erreur MySQL:", e)
            return []

    # Analyse NLP avec spaCy
    doc = nlp(msg)
    keywords = [token.lemma_ for token in doc if token.pos_ in ["NOUN", "PROPN"]]

    # Chercher tous les mots-clés trouvés
    all_results = []
    for kw in keywords:
        produits = search_product_by_keyword(kw)
        if produits:
            rep=[f"Nous avons :\n" + "\n".join([f"{nom} à un prix de  {prix} $" for nom, prix in produits]),
                 f"Nous avons à notre disponibilité :\n" + "\n".join([f"{nom} à un prix de  {prix} $" for nom, prix in produits]),
                 f"Nous proposons :\n" + "\n".join([f"{nom} à un prix abordable de  {prix} $" for nom, prix in produits])
                 ]
            rep=random.choice(rep)
            result_text=rep
            all_results.append(result_text)

    if all_results:
        return "\n\n".join(all_results)

    rep_error=["Désolé nous n'avons pas ces produits en stock",
               "Je n'ai pas trouvé ses articles dans notre boutique",
               "Désolé aucune information trouvée pour ses produits"
               ]
    rep_error=random.choice(rep_error)
    return rep_error




# Ajoutez en tête de fichier
import os
os.environ["TOKENIZERS_PARALLELISM"] = "false"  # Essentiel pour Railway


def con_BDD():
    
    # Connexion à la base de données MySQL
    conn = mysql.connector.connect(
        host="mysql-danielmambimbi.alwaysdata.net",
        user="417759_promt",  # Remplace par ton utilisateur MySQL
        password="0896966760",  # Mets ton mot de passe MySQL
        database="danielmambimbi_promt",
        port=3306
    )
    return conn

# add_br

def add_br(texte):
    response=texte.replace("\n ", "<br>")
    response=texte.replace("\n", "<br>")
    return response

# add_br

# new promt
def New_promt(promt):
    conn=con_BDD()
    cursor=conn.cursor()
    try:
        query = "INSERT INTO promt (promt) values (%s)"
        cursor.execute(query, (promt,))
        conn.commit()
        response="Enregistrement reussi"
    except:
        response="Enregistrement a echoué"
    cursor.close()
    conn.close()
    return response
# new promt




file=os.path.dirname(os.path.abspath(__file__))
# 🔹 Charger le fichier CSV
df = pd.read_csv(file + "/faq_222.csv",encoding='ISO-8859-1', sep=';')  # Assure-toi que ce fichier est dans le même dossier

# 🔹 Séparer les données
X = df["reponse"]
y = df["intent"]


det_intent_quest=joblib.load(file+"/Models/det_intent_quest.pkl")


det_intent_res=joblib.load(file+"/Models/det_intent_res.pkl")

model = SentenceTransformer('paraphrase-MiniLM-L6-v2')

# Charger la FAQ
file=os.path.dirname(os.path.abspath(__file__))
# 🔹 Charger le fichier CSV
df = pd.read_csv(file + "/faq_222.csv",encoding='ISO-8859-1', sep=';')  # Assure-toi que ce fichier est dans le même dossier

questions = df['question'].tolist()
reponses = df['reponse'].tolist()

intents_responses={}
t_total_intent=len(y)
i=0
while True:
    if y[i] in intents_responses:
        intents_responses[y[i]].append(X[i])
    else:
        intents_responses[y[i]]=[]
        intents_responses[y[i]].append(X[i])
    i+=1
    if i==t_total_intent:
        break



# print("questions : ",len(questions))
# print("reponses : ",len(reponses))
# Encoder toutes les questions une seule fois
question_embeddings = np.load(file + "/Models/question_embeddings.npy")

res_error=["Je suis désolé, j'ai ne pas bien compris votre demande. Pouvez-vous reformuler, s'il vous plaît ?",
           "Oups, je n'ai pas tout saisi. Pourriez-vous préciser ce que vous souhaitze faire ?",
           "Je ne suis pas sûr de comprendre. Pourriez-vous me donner un peu plus de détails ?",
           "Je n’ai pas bien compris votre question. Est-ce que cela concerne une commande, un retour ou un produit en particulier ?",
           "Pouvez-vous m’en dire un peu plus pour que je puisse mieux vous aider ?",
           "Est-ce que votre question concerne une commande passée, un produit, ou un problème technique ?",
           "Pour que je puisse vous aider plus efficacement, pouvez-vous préciser si vous parlez d’un échange, d’un remboursement ou d’un problème de livraison ?",
           "Je n’ai pas bien compris votre message. Pourriez-vous indiquer votre numéro de commande si cela concerne un achat ?",
           "Je n’ai pas bien compris votre demande. Je vais transférer votre message à un conseiller qui pourra vous aider.",
           "Je comprends que ce soit frustrant. Je veux vraiment vous aider, pouvez-vous reformuler votre question ?",
           "Merci pour votre message. Il semble un peu flou de mon côté. Pourriez-vous me donner plus de précisions ?",
           "Je suis là pour vous aider, mais j’ai besoin d’un peu plus d’informations pour comprendre votre demande.",
           "Je n’ai pas trouvé d’information correspondant à votre demande. Pouvez-vous reformuler en quelques mots simples ?",
           "Votre message ne correspond pas à ce que je peux traiter automatiquement. Essayons ensemble : parlez-vous d’une commande, d’un produit ou d’un retour ?",
           "Hmm… Je n’ai pas bien compris 🧐 Pouvez-vous réessayer avec d’autres mots ?",
           "Je ne suis pas sûr d’avoir bien saisi 🤖 Vous pourriez reformuler ou choisir une option ici pour m’aider à mieux vous guider."
           ]

def seuil_response(question_utilisateur, seuil=0.65):   
    response={}
    vecteur = model.encode([question_utilisateur])
    similarites = cosine_similarity(vecteur, question_embeddings)[0]
    index_max = np.argmax(similarites)
    score = similarites[index_max]
    response={
        "score":score,
        "index_max":index_max
    }
    return response

def chatbot(user_input):
    resp=seuil_response(user_input)
    input_error="no error"
    score=resp["score"]
    index_max=resp["index_max"]
    pred_intent_ques=det_intent_quest.predict([user_input])[0]
    pred_intent_res=det_intent_res.predict([reponses[index_max]])[0]
    res_chat=reponses[index_max]    
    
    if (score>=0.60):
        if (pred_intent_ques=="contact_humain"):
            res_chat="contact_humain"
        elif (pred_intent_ques=="recherche_produit"):
           res_chat=search_product(user_input) 
        elif (pred_intent_ques==pred_intent_res):
            a=[1,2,3]
            a=random.choice(a)
            if a==1:
                res_chat=reponses[index_max]
            else:
                res_chat=intents_responses[pred_intent_ques]
                res_chat=random.choice(res_chat)
        else:
           res_chat=intents_responses[pred_intent_ques]
           res_chat=random.choice(res_chat)
        input_error="no error"
    else:
        res_chat=random.choice(res_error)
        input_error="error"
    
    res_chat=res_chat.replace("\n ", "<br>")
    res_chat=res_chat.replace("\n", "<br>")
    response={
        "input_error":input_error,
        "res_chat":res_chat,
        "score":score,
        "det_intent_quest":pred_intent_ques,
        "det_intent_res":pred_intent_res
    }
    
    return response


app=Flask(__name__)
CORS(app)
@app.errorhandler(404)
def page_not_found(error):
    return 'This page does not exist', 404
@app.route('/')
def home():
    return "Hello word !"
@app.route('/health')
def health_check():
    return jsonify({"status": "healthy"}), 200


@app.route('/add_br',methods=["POST"])
def add_brs():
    message=request.form["message"]
    message=add_br(message)
    return message

@app.route('/test-components')
def test_components():
    tests = {
        "MySQL": test_mysql(),
        "spaCy": test_spacy(),
        "SentenceTransformer": test_transformer()
    }
    return jsonify(tests)

def test_mysql():
    try:
        conn = con_BDD()
        conn.close()
        return "OK"
    except Exception as e:
        return str(e)

def test_spacy():
    try:
        nlp("test")
        return "OK"
    except Exception as e:
        return str(e)

def test_transformer():
    try:
        model.encode(["test"])
        return "OK"
    except Exception as e:
        return str(e)


@app.route('/chat',methods=["POST"])
def chat():
    try:
        att="Veuillez patienter"
        response=""
        print("\n=== NOUVELLE REQUÊTE ===")  # Visible dans les logs Railway
        print("Headers:", request.headers)
        print("Form data:", request.form)
        
        if 'message' not in request.form:
            return jsonify({"error": "Missing 'message' parameter"}), 400
            
        user_input = request.form['message']
        print("Message reçu:", user_input)
        user_input=request.form["message"]
        response=chatbot(user_input)
        score=response["score"]
        intent_quest=response["det_intent_quest"]
        intent_res=response["det_intent_res"]
        input_error=response["input_error"]
        response=response["res_chat"]
        
        promt=f"promt:{user_input}\t intent_quest={intent_quest} \t intent_res={intent_res}\t scrore={score}\n"
        # save_promt=New_promt(promt)
        
        all_response={
                    "response_trans":response,
                    "att":att,
                    "input_error":input_error
                    # "save_promt":save_promt
                }
        response=all_response
        return response
    except Exception as e:
        import traceback
        traceback.print_exc()  # Log l'erreur complète
        return jsonify({
            "error": "Erreur interne",
            "details": str(e)
        }), 500
# [...] (tout le reste de votre code)

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=True)




