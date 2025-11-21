-- 1. Si è evoluto nel tempo il divario di genere?
-- Nel primo step andremo ad analizzare se anno per anno la maggioranza di genere è uomo o donna
-- Raggruppiamo gli anni singoli (dal 1968 al 2021)
-- Per per ogni anno creiamo due colonne per sapere il conteggio del genere uomo=0 e donna=1

WITH Gendercount AS (
SELECT
year,
SUM (CASE WHEN gender = 0 THEN 1 ELSE 0 END) AS male_count,
SUM (CASE WHEN gender = 1 THEN 1 ELSE 0 END) AS female_count
FROM gendip_dataset
WHERE gender IN (0,1) -- escludiamo i valori mancanti (99)
GROUP BY YEAR
)
SELECT
year,
male_count,
female_count,
CASE
WHEN male_count > female_count THEN 'male'
WHEN female_count > male_count THEN 'female'
ELSE 'equal'
END AS most_frequent_gender
FROM Gendercount
ORDER BY year;

-- 1. Dai risultati mostrati dalla tabella possiamo notare che il divario di genere nei diplomatici
--non si è ridotto nel tempo, anzi sembra essersi amplificato.
--Sebbene il numero di donne sia aumentato gradualmente, la crescita degli uomini è stata
--ancora più marcata, mantenendo un forte squilibrio.
--Questo indica che, nonostante una maggiore presenza femminile, le opportunità per le donne nella
--diplomazia sono rimaste molto più limitate rispetto agli uomini.