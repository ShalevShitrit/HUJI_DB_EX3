SELECT name, year
FROM authors NATURAL JOIN conferences AS c1
WHERE institution = 'Hebrew University of Jerusalem'
AND c1.subarea = 'ai'

INTERSECT

SELECT name, year
FROM authors NATURAL JOIN conferences AS c2
WHERE institution = 'Hebrew University of Jerusalem'
AND c2.subarea = 'economics'
ORDER BY name, year;
