SELECT DISTINCT name
FROM authors NATURAL JOIN conferences
WHERE subarea = 'ml'
GROUP BY name
HAVING COUNT(DISTINCT conference) >= 3

INTERSECT

SELECT DISTINCT name
FROM authors NATURAL JOIN conferences
WHERE subarea = 'ml' AND year >= 2020
GROUP BY name
HAVING COUNT(DISTINCT conference) >= 1
ORDER BY name;