-- 3.Quali aree geografiche mostrano maggiori disparità di genere?
-- Step 1. Creo un'altra tabella dove converto i valori numerici dei continenti in testo
-- Step 2. Dopo aver creato la tabella region_send_dip la unisco alla tab principale gendip_dataset (innerjoin)
-- Step 3. Faccio la differenza dei risultati finali e li confronto

WITH disparità AS (
SELECT
r.region_send_text AS aree_geografiche, -- seleziona i continenti in testo dalla tabella region_send_dip
COUNT (*) FILTER (WHERE g.gender = 0) AS uomini, -- calcola il n. di uomini separatamente
COUNT (*) FILTER (WHERE g.gender = 1) AS donne -- calcola il n. di donne separatamente
FROM gendip_dataset g
INNER JOIN region_send_dip r ON g.region_send = r.region_send_id
WHERE g.gender IN (0,1) -- escludo i valori numerici (99) mancanti dalla colonna gender
AND g.region_send != 9999 -- escludo i valori numerici mancanti dalla colonna continenti
GROUP BY r.region_send_text -- raggruppo i continenti
)
SELECT
aree_geografiche,
uomini,
donne,
uomini - donne AS differenza
FROM disparità
ORDER BY differenza DESC;

CREATE TABLE region_send_dip (
region_send_id INTEGER PRIMARY KEY,
region_send_text VARCHAR(150)
);

INSERT INTO region_send_dip (region_send_id, region_send_text)
VALUES
(0, 'Africa'),
(1, 'Asia'),
(2, 'Central and Noth America'),
(3, 'Europe'),
(4, 'Middle East'),
(5, 'Nordic Countries'),
(6, 'Oceania'),
(7, 'South America'),
(9999, 'missing');

-- 3.La tabella evidenzia che in Asia, Africa e Medio Oriente presentano le disparità di genere più forti,
-- con un numero significativamente maggiore di uomini rispetto alle donne.
-- Europa, pur mostrando una disparita di 20.459 persone, appare minore rispetto ad altre aree perchè ha
-- un numero più elevato di donne rispetto a regioni come l'Asia (dove le donne sono solo 1268).
-- Le aree con la minore disparità includono i paesi nordici e Oceania, dove la differenza tra uomini e donne
-- è meno marcata.