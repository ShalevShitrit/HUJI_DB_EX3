SELECT DISTINCT name
FROM authors AS a1
WHERE NOT EXISTS (
    SELECT conference, year
    FROM authors AS a2
    WHERE a2.name = 'Omri Abend'
    AND NOT EXISTS (
        SELECT 1
        FROM authors AS a3
        WHERE a3.name = a1.name
        AND a3.conference = a2.conference
        AND a2.year = a3.year
    )
)
ORDER BY name;
