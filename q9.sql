WITH publitionIns AS (
    SELECT institution, country, COALESCE(SUM(totalcount), 0) AS insCount
    FROM authors NATURAL RIGHT OUTER JOIN institutions
    GROUP BY institution, country
)

SELECT country, institution, insCount AS countryCount
FROM publitionIns AS p1
WHERE insCount = (
    SELECT MAX(insCount)
    FROM publitionIns AS p2
    WHERE p1.country = p2.country
)
ORDER BY country, institution;
