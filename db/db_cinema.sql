-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  ven. 11 juin 2021 à 08:50
-- Version du serveur :  8.0.18
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

DROP TABLE IF EXISTS `abonne`;
CREATE TABLE IF NOT EXISTS `abonne` (
  `idabonne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  PRIMARY KEY (`idabonne`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `abonne`
--

INSERT INTO `abonne` (`idabonne`, `nom`, `prenom`) VALUES
(1, 'Lloris', 'Hugo'),
(2, 'Mandanda', 'Steve'),
(3, 'Maignan', 'Mike'),
(4, 'Pavard', 'Benjamin'),
(5, 'Dubois', 'Léo'),
(6, 'Varane', 'Raphaël'),
(7, 'Zouma', 'Kurt'),
(8, 'Kimpembe', 'Presnel'),
(9, 'Lenglet', 'Clément'),
(10, 'Hernandez', 'Lucas'),
(11, 'Digne', 'Lucas'),
(12, 'Koundé', 'Jules'),
(13, 'Kanté', 'NGolo'),
(14, 'Pogba', 'Paul'),
(15, 'Rabiot', 'Adrien'),
(16, 'Tolisso', 'Corentin'),
(17, 'Sissoko', 'Moussa'),
(18, 'Lemar', 'Thomas'),
(19, 'Thuram', 'Marcus'),
(20, 'Coman', 'Kingsley'),
(21, 'Mbappé', 'Kylian'),
(22, 'Griezmann', 'Antoine'),
(23, 'Giroud', 'Olivier'),
(24, 'Benzema', 'Karim'),
(25, 'Ben Yedder', 'Wissam'),
(26, 'Dembélé', 'Ousmane');

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

DROP TABLE IF EXISTS `acteur`;
CREATE TABLE IF NOT EXISTS `acteur` (
  `idacteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  PRIMARY KEY (`idacteur`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`idacteur`, `nom`, `prenom`) VALUES
(1, 'Worthington', 'Sam'),
(2, 'downey jr', 'robert'),
(3, 'di caprio', 'leonardo'),
(4, 'ridley', 'daisy'),
(5, 'patt', 'chris'),
(6, 'glover', 'donald'),
(7, 'diesel', 'vin'),
(8, 'bell', 'kristen'),
(9, 'Boseman', 'Chadwick'),
(10, 'Radcliffe', 'Daniel'),
(11, 'watson', 'emma'),
(12, 'nelson', 'craig');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `idfilm` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `idrealisateur` int(11) NOT NULL,
  `idacteur` int(11) NOT NULL,
  PRIMARY KEY (`idfilm`),
  KEY `fk_film_realisateur1_idx` (`idrealisateur`),
  KEY `fk_film_acteur1_idx` (`idacteur`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`idfilm`, `titre`, `note`, `idrealisateur`, `idacteur`) VALUES
(1, 'Avatar', 20, 1, 1),
(2, 'Avengers', 20, 2, 2),
(3, 'Titanic', 19, 1, 3),
(4, 'Star wars', 19, 3, 4),
(5, 'Avengers', 18, 2, 2),
(6, 'Jurrassic World', 18, 4, 5),
(7, 'Le roi lion', 20, 5, 6),
(8, 'avengers', 17, 6, 2),
(9, 'fast and furious', 12, 7, 7),
(10, 'la reine des neiges', 13, 8, 8),
(11, 'avengers', 18, 6, 2),
(12, 'iron man', 15, 16, 2),
(13, 'black panther', 20, 9, 9),
(14, 'harry potter', 14, 10, 10),
(15, 'star wars', 11, 11, 4),
(16, 'jurassic worl', 12, 12, 5),
(17, 'la reine des neiges', 13, 8, 8),
(18, 'la belle et la bete', 14, 13, 11),
(19, 'fast and furious', 10, 15, 7),
(20, 'les indestructibles', 16, 14, 12);

-- --------------------------------------------------------

--
-- Structure de la table `film_vu`
--

DROP TABLE IF EXISTS `film_vu`;
CREATE TABLE IF NOT EXISTS `film_vu` (
  `idabonne` int(11) NOT NULL,
  `idfilm` int(11) NOT NULL,
  PRIMARY KEY (`idabonne`,`idfilm`),
  KEY `fk_abonnes_has_film_film1_idx` (`idfilm`),
  KEY `fk_abonnes_has_film_abonnes1_idx` (`idabonne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film_vu`
--

INSERT INTO `film_vu` (`idabonne`, `idfilm`) VALUES
(23, 1),
(18, 3),
(19, 3),
(1, 6),
(24, 6),
(5, 7),
(24, 8),
(2, 9),
(10, 12),
(26, 13),
(17, 14),
(4, 17),
(13, 18),
(14, 20);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

DROP TABLE IF EXISTS `realisateur`;
CREATE TABLE IF NOT EXISTS `realisateur` (
  `idrealisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  PRIMARY KEY (`idrealisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`idrealisateur`, `nom`, `prenom`) VALUES
(1, 'Cameron', 'James'),
(2, 'Russo', 'Les freres'),
(3, 'Abrams', 'J. J.'),
(4, 'Trevorrow', 'Colin'),
(5, 'Favreau', 'Jon'),
(6, 'Whedon', 'Joss'),
(7, 'Wan', 'James'),
(8, 'Lee', 'Jennfer'),
(9, 'Coogler', 'Ryan'),
(10, 'Yates', 'David'),
(11, 'Johnson', 'Rian'),
(12, 'Bayona', 'J.A.'),
(13, 'Condon', 'Bill'),
(14, 'Bird', 'Brad'),
(15, 'Gary Gray', 'F.'),
(16, 'Black', 'Shane');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `fk_film_acteur1` FOREIGN KEY (`idacteur`) REFERENCES `acteur` (`idacteur`),
  ADD CONSTRAINT `fk_film_realisateur1` FOREIGN KEY (`idrealisateur`) REFERENCES `realisateur` (`idrealisateur`);

--
-- Contraintes pour la table `film_vu`
--
ALTER TABLE `film_vu`
  ADD CONSTRAINT `fk_abonnes_has_film_abonnes1` FOREIGN KEY (`idabonne`) REFERENCES `abonne` (`idabonne`),
  ADD CONSTRAINT `fk_abonnes_has_film_film1` FOREIGN KEY (`idfilm`) REFERENCES `film` (`idfilm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
