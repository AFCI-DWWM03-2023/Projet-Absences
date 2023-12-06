CREATE DATABASE IF NOT EXISTS bddAbscence;

USE bddAbscence;

CREATE TABLE Utilisateur(
   idUtilisateur INT AUTO_INCREMENT NOT NULL,
   Nom VARCHAR(50) NOT NULL,
   Prenom VARCHAR(50) NOT NULL,
   Telephone VARCHAR(50) NOT NULL,
   Mail VARCHAR(50) NOT NULL,
   Identifiant VARCHAR(50) NOT NULL,
   MotdePasse VARCHAR(50) NOT NULL,
   PRIMARY KEY(idUtilisateur)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `utilisateur` ( `idUtilisateur`, `Nom`, `Prenom`, `Telephone`, `Mail`, `Identifiant`, `MotdePasse` ) 
VALUES
( 1, "Pavaday", "Kesary", "+33612345678", "kesary@mail.fr", "kesary1234", "pavaday1234");

CREATE TABLE Admin(
   idAdmin INT AUTO_INCREMENT NOT NULL,
   Nom VARCHAR(50) NOT NULL,
   Prenom VARCHAR(50) NOT NULL,
   IdentifiantAdmin VARCHAR(50) NOT NULL,
   MdpAdmin VARCHAR(50) NOT NULL,
   PRIMARY KEY(idAdmin)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admin` ( `idAdmin`, `Nom`, `Prenom`, `IdentifiantAdmin`, `MdpAdmin` )
VALUES
(1, "bricoleur", "bob", "bob1234", "bricoleur1234");

CREATE TABLE Classe(
   idClasse INT AUTO_INCREMENT NOT NULL,
   Intitule VARCHAR(50) NOT NULL,
   DateClasse DATE NOT NULL,
   idUtilisateur INT NOT NULL,
   PRIMARY KEY(idClasse),
   FOREIGN KEY(idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `classe` ( `idClasse`, `Intitule`, `DateClasse`, `idUtilisateur` ) 
VALUES
(1, "DWWM", "2023-09-24", 1);


CREATE TABLE Eleve(
   idEleve INT AUTO_INCREMENT NOT NULL,
   Nom VARCHAR(50) NOT NULL,
   Prenom VARCHAR(50) NOT NULL,
   Telephone VARCHAR(50) NOT NULL,
   Mail VARCHAR(50) NOT NULL,
   DatedeNaissance DATE NOT NULL,
   AdressePostale VARCHAR(50) NOT NULL, 
   Sexe VARCHAR(1) NOT NULL,
   idClasse INT NOT NULL NOT NULL,
   PRIMARY KEY(idEleve),
   FOREIGN KEY(idClasse) REFERENCES Classe(idClasse)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `eleve` ( `idEleve`, `Nom`, `Prenom`, `Telephone`, `Mail`, `DatedeNaissance`, `AdressePostale`, `Sexe`, `idClasse` )
VALUES
(1, "pierre", "jean", "+33612345678", "pierejean@mail.fr", "1900-01-01", "17 Boulevard Des Capucines", "H", "1");


CREATE TABLE Abscence(
   idAbscence INT AUTO_INCREMENT NOT NULL,
   DateAbscence DATE NOT NULL,
   estMatin BOOL NOT NULL,
   estAprem BOOL NOT NULL,
   idEleve INT NOT NULL,
   PRIMARY KEY(idAbscence),
   FOREIGN KEY(idEleve) REFERENCES Eleve(idEleve)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Abscence` ( `idAbscence`, `DateAbscence`, `estMatin`, `estAprem`, `idEleve` )
VALUES
(1, "2023-12-06", 1, 0, 1);

CREATE TABLE Retard(
   idRetard INT AUTO_INCREMENT NOT NULL,
   DateRetard DATE NOT NULL,
   estMatin BOOL NOT NULL,
   estAprem BOOL NOT NULL,
   TempsRetard TIME NOT NULL,
   idEleve INT NOT NULL,
   PRIMARY KEY(idRetard),
   FOREIGN KEY(idEleve) REFERENCES Eleve(idEleve)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE classe ADD CONSTRAINT FK_classe_idUtilisateur FOREIGN KEY (idUtilisateur) REFERENCES utilisateur (idUtilisateur);
ALTER TABLE eleve ADD CONSTRAINT FK_eleve_idClasse FOREIGN KEY (idClasse) REFERENCES classe (idClasse);
ALTER TABLE abscence ADD CONSTRAINT FK_absence_idEleve FOREIGN KEY (idEleve) REFERENCES eleve (idEleve);
ALTER TABLE retard ADD CONSTRAINT FK_retard_idEleve FOREIGN KEY (idEleve) REFERENCES eleve (idEleve);
