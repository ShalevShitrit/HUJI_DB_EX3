WITH NoPrerequisites AS (
    SELECT cid
    FROM Course
    WHERE cid NOT IN (SELECT cid FROM Prerequisites)
)

SELECT DISTINCT np1.cid AS cid1, np2.cid AS cid2
FROM NoPrerequisites np1 JOIN NoPrerequisites np2 ON np1.cid < np2.cid

UNION

SELECT c1.cid AS cid1, c2.cid AS cid2
FROM (
    SELECT cid, STRING_AGG(preid, ',' ORDER BY preid) AS PrereqList
    FROM Prerequisites
    GROUP BY cid) AS c1
JOIN (
    SELECT cid, STRING_AGG(preid, ',' ORDER BY preid) AS PrereqList
    FROM Prerequisites
    GROUP BY cid) AS c2
ON c1.PrereqList = c2.PrereqList AND c1.cid < c2.cid

ORDER BY cid1, cid2;
