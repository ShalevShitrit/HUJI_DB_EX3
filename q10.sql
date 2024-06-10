with authorsCount as (
select year,name,sum(totalcount) as authCount
from conferences natural join authors
where (institution = 'Hebrew University of Jerusalem') and (area = 'ai') AND (year >= 2000 and year <= 2020)
group by year,name)

select year,name
from authorsCount as a2
where authCount = ( select max(authCount) from authorsCount as a1 where a1.year = a2.year )
order by year,name