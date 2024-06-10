select distinct  name
from authors natural join conferences
where subarea = 'ml'
group by name
having count( distinct  conference) >= 3
intersect
select distinct  name
from authors natural join conferences
where subarea = 'ml' and year >= 2020
group by name
having count( distinct  conference) >= 1
order by name
