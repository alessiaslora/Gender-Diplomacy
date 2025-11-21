-- 4.Quali incarichi sono assegnati più frequentemente a uomini e donne?

SELECT
CASE
WHEN gender = 0 THEN 'uomo'
WHEN gender = 1 THEN 'donna'
END AS genere,
SUM(CASE WHEN main_posting = 1 THEN 1 ELSE 0 END) AS tot_main_posting,
SUM (CASE WHEN main_posting = 0 THEN 1 ELSE 0 END) AS tot_concurrent_accreditations
FROM gendip_dataset
WHERE gender IN (0,1)
GROUP BY gender;

-- Incarico principale nel 1968

SELECT
CASE
WHEN gender = 0 THEN 'Uomo'
WHEN gender = 1 THEN 'Donna'
END AS genere,
SUM(CASE WHEN main_posting = 1 THEN 1 ELSE 0 END) AS tot_main_posting,
SUM (CASE WHEN main_posting = 0 THEN 1 ELSE 0 END) AS tot_concurrent_accreditations
FROM gendip_dataset
WHERE gender IN (0,1)
AND year = 1968
GROUP BY gender;

-- Incarico principale nel 2021

SELECT
CASE
WHEN gender = 0 THEN 'Uomo'
WHEN gender = 1 THEN 'Donna'
END AS genere,
SUM (CASE WHEN main_posting = 1 THEN 1 ELSE 0 END) AS tot_main_posting,
SUM(CASE WHEN main_posting = 0 THEN 1 ELSE 0 END) AS tot_concurrent_accreditations
FROM gendip_dataset
WHERE gender IN (0,1)
AND year = 2021
GROUP BY gender;

-- 4. I dati mostrano una forte disparità di genere nelle assegnazioni diplomatiche nel periodo 1968-2021.
-- Nel totale, gli uomini hanno ricevuto un numero significativamente maggiore di incarichi 
-- principali rispetto alle donne.
-- Anche per le accreditazioni concorrenti - ovvero quando un diplomatico oltre a lavorare nella
-- sede principale è accreditato per rappresentare il proprio paese anche in altri stati- gli uomini
-- superano le donne, evidenziando una presenza femminile ridotta in questo settore.
-- Tuttavia,l'analisi nel tempo mostra un miglioramento nella rappresentanza femminile, sebbene la disparità
-- persista.