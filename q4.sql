select name, year
from authors natural join conferences as c1
where institution = 'Hebrew University of Jerusalem' and
    c1.subarea = 'ai'
intersect
select name, year
from authors natural join conferences as c2
where institution = 'Hebrew University of Jerusalem' and
    c2.subarea = 'economics'
order by name,year