SELECT
 c1.cid AS cid1,
 c2.cid AS cid2
FROM
 (SELECT cid, STRING_AGG(preid, ',' ORDER BY preid) AS PrereqList
 FROM Prerequisites
 GROUP BY cid) AS c1
JOIN
 (SELECT cid, STRING_AGG(preid, ',' ORDER BY preid) AS PrereqList
 FROM Prerequisites
 GROUP BY cid) AS c2
ON c1.PrereqList = c2.PrereqList AND c1.cid < c2.cid
ORDER BY c1.cid, c2.cid;

-- TODO check this query:

WITH NoPrerequisites AS (
    SELECT cid
    FROM Course
    WHERE cid NOT IN (SELECT cid FROM Prerequisites)
)
SELECT DISTINCT
    c1.cid AS cid1,
    c2.cid AS cid2
FROM
    (SELECT cid FROM Course WHERE cid NOT IN (SELECT cid FROM Prerequisites)) c1
JOIN
    (SELECT cid, preid FROM Prerequisites) p1 ON c1.cid = p1.cid
JOIN
    (SELECT cid, preid FROM Prerequisites) p2 ON p1.preid = p2.preid
JOIN
    Course c2 ON p2.cid = c2.cid AND c1.cid < c2.cid
UNION
SELECT DISTINCT
    np1.cid AS cid1,
    np2.cid AS cid2
FROM
    NoPrerequisites np1
JOIN
    NoPrerequisites np2 ON np1.cid < np2.cid
UNION
SELECT DISTINCT
    p1.cid AS cid1,
    p2.cid AS cid2
FROM
    Prerequisites p1
JOIN
    Prerequisites p2 ON p1.preid = p2.preid AND p1.cid < p2.cid;