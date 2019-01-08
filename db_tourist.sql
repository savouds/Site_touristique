-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 06 jan. 2019 à 13:20
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_tourist`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL,
  `idpersonne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `idchambre` int(11) NOT NULL,
  `idhotel` int(11) DEFAULT NULL,
  `idtypechambre` int(11) DEFAULT NULL,
  `prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `idevent` int(11) NOT NULL,
  `idplace` int(11) DEFAULT NULL,
  `datedebut` date NOT NULL,
  `datefin` date NOT NULL,
  `prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `idhotel` int(11) NOT NULL,
  `idplace` int(11) DEFAULT NULL,
  `etoiles` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `localite`
--

CREATE TABLE `localite` (
  `idlocalite` int(11) NOT NULL,
  `idtypelocalite` int(11) DEFAULT NULL,
  `nomlocalite` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `idresto` int(11) DEFAULT NULL,
  `nom` varchar(512) COLLATE utf8_general_mysql500_ci NOT NULL,
  `photo` text COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `idpersonne` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_general_mysql500_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `datenaissance` date NOT NULL,
  `numcni` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

CREATE TABLE `place` (
  `idplace` int(11) NOT NULL,
  `idlocalite` int(11) DEFAULT NULL,
  `idadmin` int(11) DEFAULT NULL,
  `nom` varchar(500) COLLATE utf8_general_mysql500_ci NOT NULL,
  `latitude` varchar(50) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8_general_mysql500_ci DEFAULT NULL,
  `siteweb` varchar(500) COLLATE utf8_general_mysql500_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `idresto` int(11) NOT NULL,
  `idplace` int(11) DEFAULT NULL,
  `etoiles` varchar(10) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sitetouristique`
--

CREATE TABLE `sitetouristique` (
  `idsite` int(11) NOT NULL,
  `idplace` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `touriste`
--

CREATE TABLE `touriste` (
  `idtourist` int(11) NOT NULL,
  `idpersonne` int(11) DEFAULT NULL,
  `provenance` varchar(0) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typechambre`
--

CREATE TABLE `typechambre` (
  `idtypechambre` int(11) NOT NULL,
  `nomtype` varchar(512) COLLATE utf8_general_mysql500_ci NOT NULL,
  `descriptiontype` varchar(512) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typelocalite`
--

CREATE TABLE `typelocalite` (
  `idtypelocalite` int(11) NOT NULL,
  `nomlocalite` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Structure de la table `visiter`
--

CREATE TABLE `visiter` (
  `idvisite` int(11) NOT NULL,
  `idtourist` int(11) DEFAULT NULL,
  `idplace` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`),
  ADD KEY `fk_reference_2` (`idpersonne`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`idchambre`),
  ADD KEY `fk_reference_10` (`idhotel`),
  ADD KEY `fk_reference_11` (`idtypechambre`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`idevent`),
  ADD KEY `fk_reference_5` (`idplace`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`idhotel`),
  ADD KEY `fk_reference_7` (`idplace`);

--
-- Index pour la table `localite`
--
ALTER TABLE `localite`
  ADD PRIMARY KEY (`idlocalite`),
  ADD KEY `fk_reference_3` (`idtypelocalite`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`),
  ADD KEY `fk_reference_9` (`idresto`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`idpersonne`);

--
-- Index pour la table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`idplace`),
  ADD KEY `fk_reference_12` (`idadmin`),
  ADD KEY `fk_reference_4` (`idlocalite`);

--
-- Index pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`idresto`),
  ADD KEY `fk_reference_8` (`idplace`);

--
-- Index pour la table `sitetouristique`
--
ALTER TABLE `sitetouristique`
  ADD PRIMARY KEY (`idsite`),
  ADD KEY `fk_reference_6` (`idplace`);

--
-- Index pour la table `touriste`
--
ALTER TABLE `touriste`
  ADD PRIMARY KEY (`idtourist`),
  ADD KEY `fk_reference_1` (`idpersonne`);

--
-- Index pour la table `typechambre`
--
ALTER TABLE `typechambre`
  ADD PRIMARY KEY (`idtypechambre`);

--
-- Index pour la table `typelocalite`
--
ALTER TABLE `typelocalite`
  ADD PRIMARY KEY (`idtypelocalite`);

--
-- Index pour la table `visiter`
--
ALTER TABLE `visiter`
  ADD PRIMARY KEY (`idvisite`),
  ADD KEY `fk_reference_13` (`idtourist`),
  ADD KEY `fk_reference_14` (`idplace`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `idchambre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `idevent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `idhotel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `localite`
--
ALTER TABLE `localite`
  MODIFY `idlocalite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `idpersonne` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `place`
--
ALTER TABLE `place`
  MODIFY `idplace` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `idresto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sitetouristique`
--
ALTER TABLE `sitetouristique`
  MODIFY `idsite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `touriste`
--
ALTER TABLE `touriste`
  MODIFY `idtourist` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `typechambre`
--
ALTER TABLE `typechambre`
  MODIFY `idtypechambre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `typelocalite`
--
ALTER TABLE `typelocalite`
  MODIFY `idtypelocalite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `visiter`
--
ALTER TABLE `visiter`
  MODIFY `idvisite` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_reference_2` FOREIGN KEY (`idpersonne`) REFERENCES `personne` (`idpersonne`);

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `fk_reference_10` FOREIGN KEY (`idhotel`) REFERENCES `hotel` (`idhotel`),
  ADD CONSTRAINT `fk_reference_11` FOREIGN KEY (`idtypechambre`) REFERENCES `typechambre` (`idtypechambre`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `fk_reference_5` FOREIGN KEY (`idplace`) REFERENCES `place` (`idplace`);

--
-- Contraintes pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_reference_7` FOREIGN KEY (`idplace`) REFERENCES `place` (`idplace`);

--
-- Contraintes pour la table `localite`
--
ALTER TABLE `localite`
  ADD CONSTRAINT `fk_reference_3` FOREIGN KEY (`idtypelocalite`) REFERENCES `typelocalite` (`idtypelocalite`);

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_reference_9` FOREIGN KEY (`idresto`) REFERENCES `restaurant` (`idresto`);

--
-- Contraintes pour la table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `fk_reference_12` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`idadmin`),
  ADD CONSTRAINT `fk_reference_4` FOREIGN KEY (`idlocalite`) REFERENCES `localite` (`idlocalite`);

--
-- Contraintes pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `fk_reference_8` FOREIGN KEY (`idplace`) REFERENCES `place` (`idplace`);

--
-- Contraintes pour la table `sitetouristique`
--
ALTER TABLE `sitetouristique`
  ADD CONSTRAINT `fk_reference_6` FOREIGN KEY (`idplace`) REFERENCES `place` (`idplace`);

--
-- Contraintes pour la table `touriste`
--
ALTER TABLE `touriste`
  ADD CONSTRAINT `fk_reference_1` FOREIGN KEY (`idpersonne`) REFERENCES `personne` (`idpersonne`);

--
-- Contraintes pour la table `visiter`
--
ALTER TABLE `visiter`
  ADD CONSTRAINT `fk_reference_13` FOREIGN KEY (`idtourist`) REFERENCES `touriste` (`idtourist`),
  ADD CONSTRAINT `fk_reference_14` FOREIGN KEY (`idplace`) REFERENCES `place` (`idplace`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
