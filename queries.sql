 -- 1- Combien de participants avez vous ? 

SELECT COUNT(*) AS nombre_participants
FROM participants;

-- 2- Combien de participants habitent dans la région 33 ?

SELECT COUNT(*) AS nombre_participants_region_33
FROM participants
WHERE region = '33';

-- 3- Combien de femmes préparent une formation du titre "Concepteur Développeur d'Applications" ?

SELECT COUNT(*) AS nombre_femmes_CDA
FROM participants p
JOIN formations f ON p.id = f.participant_id
WHERE p.sexe = 'F'
AND f.titre = 'Concepteur Développeur d\'Applications';

-- 4- Donnez le nombre de notes supérieures à 12 obtenues par Donal Duck
  
SELECT COUNT(*) AS nombre_notes_sup_12
FROM notes n
JOIN participants p ON p.id = n.participant_id
WHERE p.nom = 'Duck' AND p.prenom = 'Donal'
AND n.note > 12;

-- 5- Donner le nombre d'adresse mail par participant, même si il n'en ont pas ?
  
SELECT p.nom, p.prenom, COUNT(e.email) AS nombre_emails
FROM participants p
LEFT JOIN emails e ON p.id = e.participant_id
GROUP BY p.id, p.nom, p.prenom;

-- 6- Donner le nombre d'adresse mail par participant, même si il n'en ont pas ?
  
SELECT AVG(note) AS moyenne_php
FROM notes
WHERE module = 'PHP';

-- 7- Donner le nom des participant ayant été noté sur plus de 2 modules .
  
SELECT p.nom, p.prenom
FROM participants p
JOIN notes n ON p.id = n.participant_id
GROUP BY p.id, p.nom, p.prenom
HAVING COUNT(DISTINCT n.module) > 2;

-- 8- Quels sont les participants ayant obtenu pour le module PHP une note inférieure à la moyenne des notes du module PHP ?
  
WITH moyenne_php AS (
    SELECT AVG(note) AS moyenne
    FROM notes
    WHERE module = 'PHP'
)
SELECT p.nom, p.prenom, n.note
FROM participants p
JOIN notes n ON p.id = n.participant_id
JOIN moyenne_php m ON n.module = 'PHP' AND n.note < m.moyenne;

-- 9-  Afficher les 5 premiers participants par ordre alphabétique du nom et du prénom
  
SELECT nom, prenom
FROM participants
ORDER BY nom, prenom
LIMIT 5;

-- 10- Donner le nom et le prénom des participants masculins âgés de plus de 24 ans en indiquant pour chacun le nombre de modules auxquels ils ont été évalués en 2024.
  
SELECT p.nom, p.prenom, COUNT(n.module) AS nombre_modules
FROM participants p
JOIN notes n ON p.id = n.participant_id
WHERE p.sexe = 'M' AND p.age > 24 AND YEAR(n.date_evaluation) = 2024
GROUP BY p.id, p.nom, p.prenom;

-- 11- Afficher pour chaque participante, son nom, son prénom, son age, le nom de la société dans laquelle elle travaille actuellement (ou "Aucune" si elle ne travaille pas) ainsi que le noms des modules sur lesquelles elles ont obtenu une note supérieure à 14
SELECT p.nom, p.prenom, p.age,
       COALESCE(e.entreprise, 'Aucune') AS entreprise,
       CASE 
           WHEN COUNT(DISTINCT n.module) > 0 THEN GROUP_CONCAT(DISTINCT n.module ORDER BY n.module SEPARATOR ', ')
           ELSE NULL 
       END AS modules_sup_14
FROM participants p
LEFT JOIN emplois e ON p.id = e.participant_id AND (e.date_fin IS NULL OR e.date_fin > CURDATE())
LEFT JOIN notes n ON p.id = n.participant_id AND n.note > 14
WHERE p.sexe = 'F'
GROUP BY p.id, p.nom, p.prenom, p.age, entreprise;
