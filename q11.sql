WITH youngCon AS (
    SELECT conference
    FROM authors
    GROUP BY conference
    HAVING COUNT(DISTINCT year) <= 15
)
select distinct  name
from authors as a1
where not EXISTS(
    select conference
    from authors as a2
    where a1.name = a2.name and a2.conference not in (select conference from youngCon)
)
order by name