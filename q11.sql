WITH youngCon AS (
    SELECT conference
    FROM authors
    GROUP BY conference
    HAVING COUNT(DISTINCT year) <= 15
)

SELECT DISTINCT name
FROM authors AS a1
WHERE NOT EXISTS (
    SELECT conference
    FROM authors AS a2
    WHERE a1.name = a2.name
    AND a2.conference NOT IN (SELECT conference FROM youngCon)
)
ORDER BY name;
