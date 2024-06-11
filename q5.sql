SELECT DISTINCT name
FROM authors NATURAL JOIN conferences
WHERE year < 1980 AND area = 'theory'
  AND NOT EXISTS (
    SELECT 1
    FROM authors AS a
    NATURAL JOIN conferences AS c
    WHERE a.name = authors.name
      AND (a.year >= 1980 OR c.area != 'theory')
  )
ORDER BY name;
