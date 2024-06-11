SELECT DISTINCT institution, name
FROM authors NATURAL JOIN institutions
WHERE conference LIKE 'sig%' AND totalcount >= 2 AND country = 'il'
ORDER BY institution, name;
