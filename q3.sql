select distinct institution,name
from authors natural join institutions
where conference like 'sig%' and totalcount >= 2 and country = 'il'
order by institution,name