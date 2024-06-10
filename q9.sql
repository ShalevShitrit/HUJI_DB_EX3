with publitionIns as (

select institution, country ,COALESCE(SUM(totalcount), 0) as insCount
from authors natural right outer join institutions
group by institution,country)


select country ,institution  ,insCount as countryCount
from publitionIns as p1
where insCount = ( select max(insCount) from publitionIns as p2 where p1.country = p2.country)
order by country,institution

