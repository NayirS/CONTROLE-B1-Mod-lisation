-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 août 2024 à 14:10
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `competition sport`
--

-- --------------------------------------------------------

--
-- Structure de la table `amateur`
--

CREATE TABLE `amateur` (
  `IDAmateur` int(11) NOT NULL,
  `Certificat_Médical` varchar(255) DEFAULT NULL,
  `IDParticipant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compétition`
--

CREATE TABLE `compétition` (
  `IDCompétition` int(11) NOT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `Libellé` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `concourt`
--

CREATE TABLE `concourt` (
  `IDParticipant` int(11) NOT NULL,
  `IDCompétition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

CREATE TABLE `date` (
  `DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

CREATE TABLE `epreuve` (
  `IDEpreuve` int(11) NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Distance` float DEFAULT NULL,
  `Conditions` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `licencié`
--

CREATE TABLE `licencié` (
  `IDlicencié` int(11) NOT NULL,
  `Club` varchar(255) DEFAULT NULL,
  `IDParticipant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `IDParticipant` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prénom` varchar(255) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Téléphone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

CREATE TABLE `participe` (
  `IDEpreuve` int(11) NOT NULL,
  `IDCompétition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `amateur`
--
ALTER TABLE `amateur`
  ADD PRIMARY KEY (`IDAmateur`),
  ADD KEY `IDParticipant` (`IDParticipant`);

--
-- Index pour la table `compétition`
--
ALTER TABLE `compétition`
  ADD PRIMARY KEY (`IDCompétition`),
  ADD KEY `Date` (`Date`);

--
-- Index pour la table `concourt`
--
ALTER TABLE `concourt`
  ADD PRIMARY KEY (`IDParticipant`,`IDCompétition`),
  ADD KEY `IDCompétition` (`IDCompétition`);

--
-- Index pour la table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`DATE`);

--
-- Index pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`IDEpreuve`);

--
-- Index pour la table `licencié`
--
ALTER TABLE `licencié`
  ADD PRIMARY KEY (`IDlicencié`),
  ADD KEY `IDParticipant` (`IDParticipant`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`IDParticipant`);

--
-- Index pour la table `participe`
--
ALTER TABLE `participe`
  ADD PRIMARY KEY (`IDEpreuve`,`IDCompétition`),
  ADD KEY `IDCompétition` (`IDCompétition`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `amateur`
--
ALTER TABLE `amateur`
  MODIFY `IDAmateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compétition`
--
ALTER TABLE `compétition`
  MODIFY `IDCompétition` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `epreuve`
--
ALTER TABLE `epreuve`
  MODIFY `IDEpreuve` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `licencié`
--
ALTER TABLE `licencié`
  MODIFY `IDlicencié` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `participant`
--
ALTER TABLE `participant`
  MODIFY `IDParticipant` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `amateur`
--
ALTER TABLE `amateur`
  ADD CONSTRAINT `amateur_ibfk_1` FOREIGN KEY (`IDParticipant`) REFERENCES `participant` (`IDParticipant`);

--
-- Contraintes pour la table `compétition`
--
ALTER TABLE `compétition`
  ADD CONSTRAINT `compétition_ibfk_1` FOREIGN KEY (`Date`) REFERENCES `date` (`DATE`);

--
-- Contraintes pour la table `concourt`
--
ALTER TABLE `concourt`
  ADD CONSTRAINT `concourt_ibfk_1` FOREIGN KEY (`IDParticipant`) REFERENCES `participant` (`IDParticipant`),
  ADD CONSTRAINT `concourt_ibfk_2` FOREIGN KEY (`IDCompétition`) REFERENCES `compétition` (`IDCompétition`);

--
-- Contraintes pour la table `licencié`
--
ALTER TABLE `licencié`
  ADD CONSTRAINT `licencié_ibfk_1` FOREIGN KEY (`IDParticipant`) REFERENCES `participant` (`IDParticipant`);

--
-- Contraintes pour la table `participe`
--
ALTER TABLE `participe`
  ADD CONSTRAINT `participe_ibfk_1` FOREIGN KEY (`IDEpreuve`) REFERENCES `epreuve` (`IDEpreuve`),
  ADD CONSTRAINT `participe_ibfk_2` FOREIGN KEY (`IDCompétition`) REFERENCES `compétition` (`IDCompétition`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
