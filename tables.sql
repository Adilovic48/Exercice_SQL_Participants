-- Table des participants
CREATE TABLE participants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    sexe ENUM('M', 'F') NOT NULL,
    age INT,
    region VARCHAR(2) NOT NULL
);

-- Table des formations
CREATE TABLE formations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100) NOT NULL
);

-- Table des notes
CREATE TABLE notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    participant_id INT,
    module VARCHAR(50) NOT NULL,
    note INT,
    date DATE,
    FOREIGN KEY (participant_id) REFERENCES participants(id)
);

-- Table des emails
CREATE TABLE emails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    participant_id INT,
    email VARCHAR(100) NOT NULL,
    FOREIGN KEY (participant_id) REFERENCES participants(id)
);

-- Table des emplois (ou sociétés)
CREATE TABLE emplois (
    id INT PRIMARY KEY AUTO_INCREMENT,
    participant_id INT,
    entreprise VARCHAR(100),
    date_debut DATE,
    date_fin DATE,
    FOREIGN KEY (participant_id) REFERENCES participants(id)
);

