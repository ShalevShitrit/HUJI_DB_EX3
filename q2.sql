select distinct  institution,name
from authors natural join institutions
where region = 'africa'
order by institution,name