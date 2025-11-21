-- 2. I paesi che inviano i propri diplomatici all'estero promuovono una politica estera femminista?
--Step 1. Sapere la quantità totale dei paesi presenti nell'anno 1968 e nell'anno 2021

SELECT COUNT(DISTINCT cname_send) AS numero_paesi
FROM gendip_dataset
WHERE year = 1968;

SELECT COUNT (DISTINCT cname_send) AS numero_paesi
FROM gendip_dataset
WHERE year = 2021;

-- Step 2. Seleziono solo i paesi che non promuovono una politica estera femminista (no)
-- Confronto i dati del 1968 e 2021

SELECT DISTINCT
cname_send AS paese,
CASE WHEN ffp_send = 0 THEN 'No' ELSE 'Si'
END AS politica_femminista
FROM gendip_dataset
WHERE ffp_send = 0
AND year = 1968;

SELECT DISTINCT
cname_send AS paese,
CASE WHEN ffp_send = 0 THEN 'No' ELSE 'Si'
END AS politica_femminista
FROM gendip_dataset
WHERE ffp_send = 0
AND year = 2021;

-- Step 3. Seleziono solo i paesi che promuovono una politica estera femminista (si)
-- Confronto date del 1968 e 2021

SELECT DISTINCT
cname_send AS paese,
CASE WHEN ffp_send = 1 THEN 'SI' ELSE 'NO'
END AS politica_femminista
FROM gendip_dataset
WHERE ffp_send = 1
AND year = 1968;

SELECT DISTINCT
cname_send AS paese,
CASE WHEN ffp_send = 1 THEN 'SI' ELSE 'NO'
END AS politica_femminista
FROM gendip_dataset
WHERE ffp_send = 1
AND year = 2021;

-- 2. I paesi che inviano i propri diplomatici all'estero promuovono una politica estera femminista?

-- 2. I risultati mostrano che nel 1968, nessun paese promuoveva una politica estera femminista,
-- mentre nel 2021 solo 7 paesi hanno dichiarato di farlo, evidenziando un progresso molto limitato
-- in questo ambito. Al contrario, i paesi che non promuovono una politica femminista sono aumentati,
-- passando da 135 nel 1968 a 190 nel 2021. La maggior parte dei paesi non ha adottato ancora approcci
-- concreti in ambito diplomatico per promuovere la parità di genere.