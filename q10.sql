WITH authorsCount AS (
    SELECT year, name, SUM(totalcount) AS authCount
    FROM conferences NATURAL JOIN authors
    WHERE (institution = 'Hebrew University of Jerusalem')
    AND (area = 'ai')
    AND (year >= 2000 AND year <= 2020)
    GROUP BY year, name
)

SELECT year, name
FROM authorsCount AS a2
WHERE authCount = (
    SELECT MAX(authCount)
    FROM authorsCount AS a1
    WHERE a1.year = a2.year
)
ORDER BY year, name;