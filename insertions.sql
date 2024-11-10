INSERT INTO participants (nom, prenom, sexe, age, region) 
VALUES 
    ('Dupont', 'Alice', 'F', 30, '33'),
    ('Martin', 'Bob', 'M', 28, '33'),
    ('Leroy', 'Chloé', 'F', 32, '64'),
    ('Donal', 'Duck', 'M', 25, '33');

-- Créer des formations
INSERT INTO formations (titre) 
VALUES 
    ('Concepteur Développeur d\'Applications'),
    ('Développement Web'),
    ('Développement Mobile'),
    ('Réseaux et Infra');

-- Associer des formations aux participants (vous pouvez ajuster l'association selon vos besoins)
INSERT INTO participant_formation (participant_id, formation_id) 
VALUES
    (1, 1),  -- Alice suit "Concepteur Développeur d'Applications"
    (3, 1);  -- Chloé suit "Concepteur Développeur d'Applications"
    

-- Ajouter des notes pour les participants
INSERT INTO notes (participant_id, module, note, date_evaluation) 
VALUES 
    (1, 'PHP', 14, '2023-05-20'),
    (2, 'JS', 12, '2023-06-15'),
    (3, 'REACT', 16, '2023-06-01'),
    (4, 'Cyber', 13, '2024-05-11');

-- Ajouter des emails pour les participants
INSERT INTO emails (participant_id, email) 
VALUES 
    (1, 'alice.dupont@example.com'),
    (2, 'bob.martin@example.com'),
    (3, 'chloe.leroy@example.com'),
    (4, 'donal.duck@example.com');
