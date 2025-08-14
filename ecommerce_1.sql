-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 12 août 2025 à 12:16
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce_1`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1,
  `date_add` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `username`, `produit_id`, `quantite`, `date_add`) VALUES
(13, 'alpha160', 129, 2, '2025-07-12 22:22:48'),
(18, 'alpha160', 128, 1, '2025-07-13 16:38:15'),
(19, 'alpha160', 126, 1, '2025-07-13 16:38:20'),
(20, 'alpha160', 151, 1, '2025-07-18 16:12:00'),
(21, 'bravo', 146, 1, '2025-07-19 18:39:17'),
(22, 'bravo', 138, 1, '2025-07-19 18:39:19'),
(23, 'Alpha', 143, 1, '2025-08-10 03:28:39'),
(24, 'Alpha', 137, 1, '2025-08-10 03:28:44'),
(25, 'Alpha', 128, 1, '2025-08-10 03:29:41');

-- --------------------------------------------------------

--
-- Structure de la table `images_produits`
--

CREATE TABLE `images_produits` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `url_image` varchar(255) NOT NULL,
  `est_principale` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `images_produits`
--

INSERT INTO `images_produits` (`id`, `produit_id`, `url_image`, `est_principale`) VALUES
(1200, 116, 'a16512d5-3f84-469c-b201-6b3b6287e0cb.jpg', 1),
(1201, 116, 'bb5d37a8-5230-4969-b757-07f8c20743cc.jpg', 0),
(1202, 116, 'fefd15ec-d788-4462-bbfa-319a72d4bc33.jpg', 0),
(1203, 124, '204063ed-9b89-452f-a155-8c5b5b3bff5f.png', 1),
(1204, 124, 'ff55e040-08a5-416b-aa30-9d6afc0c9fc8.jpg', 0),
(1205, 124, '3a99b6f9-2b83-42cf-be2c-4d62ded2cea6.jpg', 0),
(1206, 124, 'b61e4d0b-316f-4287-8202-168a2a386702.jpg', 0),
(1207, 125, 'a9807c94-4181-4d3c-a945-ff0f743dbc87.png', 1),
(1208, 125, 'ff060320-47f8-48fd-aaaf-6a3fdbe48102.jpg', 0),
(1209, 125, '0a380a74-48e0-411e-8cee-fe4107fe185b.jpg', 0),
(1210, 126, '364fc6ca-3197-4dff-b6b6-cc7785f1569a.png', 1),
(1211, 126, 'b182ec3f-d435-49b8-bd17-f5b9d61d17b6.jpg', 0),
(1212, 126, '3a032883-5c1b-4ae2-b3a6-f3929c58872d.jpg', 0),
(1213, 126, '44ac3f69-44db-4c90-aa31-5466d69f1135.jpg', 0),
(1214, 127, '70820a40-eed5-4a5a-ac26-83543c7d6046.jpg', 1),
(1215, 127, 'a7c4b378-adc0-45db-9fe5-5709b9dd37e0.jpg', 0),
(1216, 127, '1bf5b483-5fe4-4155-b3b7-c91c76781ea3.jpg', 0),
(1217, 128, '06f95015-9795-41ec-85ea-e223a8cab799.jpg', 1),
(1218, 128, 'd7f1a3e8-855d-42a8-b54e-cab0feae30cd.jpg', 0),
(1219, 128, 'a9f9927d-2d34-46c8-88e9-e6eb0540ce41.jpg', 0),
(1220, 129, '20068cbf-2b74-4a87-94af-dfb6d2886836.jpg', 1),
(1221, 129, 'fc4b186d-b054-4bf4-a13e-6b40afbf8610.jpg', 0),
(1222, 129, 'bba8f741-b71b-4b56-bbc1-662cfcaa2902.jpg', 0),
(1223, 129, '74745a55-850a-4807-9d7c-a5a5f2f37139.jpg', 0),
(1224, 130, '6ff5af8f-b7ba-4f9a-9a0c-255c784f66a3.jpg', 1),
(1225, 131, 'b7209df7-27d5-45dd-837c-1e4cb7d48d08.jpg', 1),
(1226, 132, 'none', 1),
(1227, 133, 'none', 1),
(1228, 134, 'none', 1),
(1229, 135, 'none', 1),
(1230, 142, 'none', 1),
(1231, 143, 'none', 1),
(1232, 144, 'none', 1),
(1233, 146, 'none', 1),
(1234, 149, 'a2940128-7ca1-4531-b4ed-3121c8d0117b.jpg', 1),
(1235, 150, 'b5eb8f32-535c-4026-8350-ba2febe52ff1.jpg', 1),
(1236, 151, '3b0f8e0e-84d4-4e98-8b48-b6ada3253d0a.jpg', 1),
(1237, 151, 'c8e39440-4161-4978-8dbe-945ea7548ac6.jpg', 0),
(1238, 151, '519e0d19-ab25-4fd5-a2e7-85d85d02f747.jpg', 0),
(1239, 151, '3f9bfffe-4af4-4e47-9dd2-d3a3734975b1.jpg', 0),
(1240, 152, '84e08258-2574-4415-9532-95c4ae3366f4.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `info_users`
--

CREATE TABLE `info_users` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `postnom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `info_users`
--

INSERT INTO `info_users` (`id_user`, `nom`, `postnom`, `prenom`, `tel`, `email`, `username`) VALUES
(28, 'Mambimbi', 'Khonde', 'Daniel', '0896966760', 'danielmambimbi@gmail.com', 'Daniel Mambimbi'),
(29, 'Mambimbi', 'Khonde', 'Daniel', '0896966760', 'danielmambimbi@gmail.com', 'Daniel Mambi'),
(30, 'Inconnu', 'Inconnu', 'Alpha', '160', 'alpha@gmail.com', 'Alpha'),
(31, 'Inconnu', 'Inconnu', 'Jaguar', 'Inconnu', 'Inconnu', 'Jaguar'),
(32, 'Mambimbi', 'Khonde', 'Daniel', '0896966760', 'Alpha', 'Daniel Mambimbi123'),
(33, 'Inconnu', 'Inconnu', 'Inconnu', 'Inconnu', 'Inconnu', 'alpha160'),
(34, 'Inconnu', 'Inconu', 'Alphz160', '0', '0', 'Alphz160'),
(35, 'phanzu', 'Inconnu', 'Jeremias', '0', '0', 'Jeremias'),
(36, 'Mambimbi', 'Khonde', 'Jordan', '0896966760', 'a', 'Jordan'),
(37, 'Inconnu', 'Inconnu', 'abc', '0896966760', 'a', 'abc'),
(38, 'inconnu', 'inconnu', 'Brovo', '0896966760', 'danielmambimbi@gmail.com', 'Brovo'),
(39, 'inconnu', 'inconnu', 'bravo', '0896966760', 'danielmambimbi@gmail.com', 'bravo');

-- --------------------------------------------------------

--
-- Structure de la table `logins`
--

CREATE TABLE `logins` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `logins`
--

INSERT INTO `logins` (`username`, `password`, `profil`) VALUES
('abc', '123', '9709d872-6a7d-4f65-afb4-677c9174339a.jpg'),
('Alpha', '123', '579ed650-7552-4d6c-9037-dd63d593813c.jpg'),
('alpha160', '123', '434f0423-5ca8-4376-a5e3-a08d8c366010.jpg'),
('Alphz160', '0', 'd:\\CHAT\\Page chat\\ecom_page\\ecom_page1 - Copie - Copie\\Page_chat1 - desi/Profil_users/ad41d2fc-5c6d-43bd-86c9-389a2c2bf55a.jpg'),
('bravo', '123', 'cb974f8b-6981-4ffc-85c2-68c3eaeb1ca9.jpg'),
('Brovo', '123', '0c527141-9106-4000-9a79-f1c4657917d9.jpg'),
('Daniel Mambi', '123', 'eee857ae-1969-4390-83da-8b59cb2089a0.jpg'),
('Daniel Mambimbi', 'a', '30e68c95-0d49-4513-857c-fabf6700340d.jpg'),
('Daniel Mambimbi123', '123', 'none'),
('Jaguar', 'a', 'none'),
('Jeremias', '123', 'd:\\CHAT\\Page chat\\ecom_page\\ecom_page1 - Copie - Copie\\Page_chat1 - desi/Profil_users/c5c87ecf-bd0d-44c7-8fa2-10880c41506d.jpg'),
('Jordan', '123', 'Profil_users/c8e3f8b7-a1a1-4798-b0fc-8d9922c42a44.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `statut` varchar(255) DEFAULT 'active',
  `date_creation` datetime DEFAULT current_timestamp(),
  `date_modification` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fournisseur` varchar(255) DEFAULT NULL,
  `tel_fsseur` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `marque` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `stock`, `categorie`, `statut`, `date_creation`, `date_modification`, `fournisseur`, `tel_fsseur`, `image`, `sku`, `marque`) VALUES
(114, 'Smartphone X1', '', '12.00', 25, 'Chaussure', 'active', '2025-05-24 13:10:53', '2025-05-24 13:10:53', '', '', NULL, NULL, NULL),
(115, 'T-Shirt Classique', '', '48.00', 2, 'Maison', 'active', '2025-05-24 13:12:49', '2025-05-24 13:12:49', '', '', NULL, NULL, NULL),
(116, 'Jean Slim Fit', '', '10.00', 20, 'Maison', 'active', '2025-05-24 13:14:48', '2025-05-24 13:14:48', '', '', NULL, NULL, NULL),
(117, 'bleuson', '', '45.00', 20, 'Maison', 'active', '2025-05-24 13:16:33', '2025-05-24 13:16:33', '', '', NULL, NULL, NULL),
(118, 'Smartphone X1', '', '12.00', 20, 'Vêtements', 'active', '2025-05-24 13:19:15', '2025-05-24 13:19:15', '', '', NULL, NULL, NULL),
(119, 'T-Shirt Classique', '', '10.00', 125, 'Vêtements', 'active', '2025-05-24 13:25:34', '2025-05-24 13:25:34', '', '', NULL, NULL, NULL),
(120, 'Jean Slim Fit', '', '10.00', 25, 'Vêtements', 'active', '2025-05-24 13:30:40', '2025-05-24 13:30:40', '', '', NULL, NULL, NULL),
(121, 'bleuson', '', '15.00', 25, 'Maison', 'active', '2025-05-24 13:31:21', '2025-05-24 13:31:21', '', '', NULL, NULL, NULL),
(122, 'Smartphone X1', '', '10.00', 25, 'Maison', 'active', '2025-05-24 13:32:53', '2025-05-24 13:32:53', '', '', NULL, NULL, NULL),
(123, 'Jean Slim Fit', '', '5.00', 68, 'Maison', 'active', '2025-05-24 13:34:40', '2025-05-24 13:34:40', '', '', NULL, NULL, NULL),
(124, 'T-Shirt Classique', '', '10.00', 45, 'Maison', 'active', '2025-05-24 13:36:16', '2025-05-24 13:36:16', '', '', NULL, NULL, NULL),
(125, 'bleuson', '', '10.00', 45, 'Vêtements', 'active', '2025-05-24 13:37:36', '2025-05-24 13:37:36', '', '', NULL, NULL, NULL),
(126, 'Jean Slim Fit', '', '10.00', 26, 'Chaussure', 'active', '2025-05-24 13:40:25', '2025-05-24 13:40:25', '', '', NULL, NULL, NULL),
(127, 'Smartphone X1', '', '12.00', 20, 'Chaussure', 'active', '2025-05-24 13:41:16', '2025-05-24 13:41:16', '', '', NULL, NULL, NULL),
(128, 'Lampe de Bureau LED', '', '14.00', 8, 'Maison', 'active', '2025-05-24 13:42:28', '2025-05-24 13:42:28', '', '', NULL, NULL, NULL),
(129, 'Jean Slim Fit', '', '15.00', 36, 'Maison', 'active', '2025-05-24 13:43:14', '2025-05-24 13:43:14', '', '', NULL, NULL, NULL),
(130, 'Lampe de Bureau LED', '', '7.25', 10, 'Électronique', 'active', '2025-07-09 20:44:30', '2025-07-09 20:44:30', '', '', NULL, NULL, NULL),
(131, 'bleuson', '', '38.00', 2, 'Vêtements', 'active', '2025-07-13 17:07:29', '2025-07-13 17:07:29', '', '', NULL, NULL, NULL),
(132, 'T-Shirt Classique', '', '32.00', 2, 'Vêtements', 'active', '2025-07-17 23:12:40', '2025-07-17 23:12:40', '', '', NULL, NULL, NULL),
(133, 'Jean Slim Fit', '', '41.00', 0, 'Parfum', 'active', '2025-07-17 23:27:09', '2025-07-17 23:27:09', '', '', NULL, NULL, NULL),
(134, 'Lampe de Bureau LED', '', '56.00', 1, 'Maison', 'active', '2025-07-17 23:41:58', '2025-07-17 23:41:58', '', '', NULL, NULL, NULL),
(135, 'Jean Slim Fit', '', '15.00', 3, 'Maison', 'active', '2025-07-17 23:42:58', '2025-07-17 23:42:58', '', '', NULL, NULL, NULL),
(136, 'Jean Slim Fit', '', '10.00', 10, 'Vêtements', 'active', '2025-07-17 23:48:50', '2025-07-17 23:48:50', '', '', NULL, NULL, NULL),
(137, 'Jean Slim Fit', '', '23.00', 5, 'Vêtements', 'active', '2025-07-18 00:02:23', '2025-07-18 00:02:23', '', '', NULL, NULL, NULL),
(138, 'Jean Slim Fit', '', '53.00', 20, 'Maison', 'active', '2025-07-18 14:04:47', '2025-07-18 14:04:47', '', '', NULL, NULL, NULL),
(139, 'Jean Slim Fit', '', '41.00', 20, 'Maison', 'active', '2025-07-18 14:06:29', '2025-07-18 14:06:29', '', '', NULL, NULL, NULL),
(140, 'Jean Slim Fit', '', '44.00', 10, 'Parfum', 'active', '2025-07-18 14:08:45', '2025-07-18 14:08:45', '', '', NULL, NULL, NULL),
(141, 'Smartphone X1', '', '48.00', 10, 'Chaussure', 'active', '2025-07-18 14:11:57', '2025-07-18 14:11:57', '', '', NULL, NULL, NULL),
(142, 'T-Shirt Classique', '', '12.00', 12, 'Vêtements', 'active', '2025-07-18 14:14:42', '2025-07-18 14:14:42', '', '', NULL, NULL, NULL),
(143, 'bleuson', '', '45.00', 20, 'Vêtements', 'active', '2025-07-18 14:15:15', '2025-07-18 14:15:15', '', '', NULL, NULL, NULL),
(144, 'Smartphone X1', '', '12.00', 10, 'Chaussure', 'active', '2025-07-18 14:18:19', '2025-07-18 14:18:19', '', '', NULL, NULL, NULL),
(145, 'Jean Slim Fit', '', '10.00', 45, 'Parfum', 'active', '2025-07-18 14:21:27', '2025-07-18 14:21:27', '', '', NULL, NULL, NULL),
(146, 'bleuson', '', '120.00', 10, 'Maison', 'active', '2025-07-18 14:23:07', '2025-07-18 14:23:07', '', '', NULL, NULL, NULL),
(147, 'T-Shirt Classique', '', '14.00', 10, 'Parfum', 'active', '2025-07-18 14:25:30', '2025-07-18 14:25:30', '', '', NULL, NULL, NULL),
(148, 'Smartphone X1', '', '15.00', 10, 'Maison', 'active', '2025-07-18 14:25:55', '2025-07-18 14:25:55', '', '', NULL, NULL, NULL),
(149, 'bleuson', '', '100.00', 100, 'Chaussure', 'active', '2025-07-18 14:28:18', '2025-07-18 14:28:18', '', '', NULL, NULL, NULL),
(150, 'Smartphone X1', '', '45.00', 2, 'Maison', 'active', '2025-07-18 16:07:18', '2025-07-18 16:07:18', '', '', NULL, NULL, NULL),
(151, 'Jean Slim Fit', '', '120.00', 20, 'Parfum', 'active', '2025-07-18 16:08:22', '2025-07-18 16:08:22', '', '', NULL, NULL, NULL),
(152, 'T-Shirt Classique', '', '120.00', 1, 'Chaussure', 'active', '2025-07-18 16:32:00', '2025-07-18 16:32:00', '', '', NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `images_produits`
--
ALTER TABLE `images_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `info_users`
--
ALTER TABLE `info_users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_username` (`username`);

--
-- Index pour la table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `images_produits`
--
ALTER TABLE `images_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1241;

--
-- AUTO_INCREMENT pour la table `info_users`
--
ALTER TABLE `info_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`username`) REFERENCES `logins` (`username`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `images_produits`
--
ALTER TABLE `images_produits`
  ADD CONSTRAINT `images_produits_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `info_users`
--
ALTER TABLE `info_users`
  ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `logins` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `info_users_ibfk_1` FOREIGN KEY (`username`) REFERENCES `logins` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
