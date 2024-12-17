-- find the number of crashes per BOROUGH
select borough,count(*) as `number of crashes`
from collisions 
group by borough;

-- Identify the ON STREET NAME with the most crashes
select `ON STREET NAME`,count(*) 
from collisions
group by 1
order by 2 desc
limit 1;

-- Show only those BOROUGHs where more than 500 crashes occurred
select BOROUGH 
from collisions
group by borough
having count(*) >500;



-- Extract the year from CRASH DATE and find how many crashes occurred each year

-- select STR_TO_DATE(`crash date`, '%Y-%m-%d') from collisions ;


select year(`crash date`), count(year(`crash date`)) from collisions 
group by year(`crash date`)
order by year(`crash date`);


--    Write a query to count the number of crashes where pedestrians were injured (NUMBER OF PEDESTRIANS INJURED > 0)

select count(*)
from collisions 
where `NUMBER OF PEDESTRIANS INJURED` > 0;

--    Find the total number of persons killed in crashes caused by "Driver Inattention/Distraction"

select count(*)
from collisions
where `CONTRIBUTING FACTOR VEHICLE 1`='Driver Inattention/Distraction';

--    Find all records where the ON STREET NAME contains "BROADWAY"

select *
from collisions
where `ON STREET NAME` like '%broadway';

--    Write a query to find the ON STREET NAME with the highest number of injuries.

select `ON STREET NAME` ,count(`number of persons injured`)
from collisions
group by 1
order by 2 desc
limit 1;

--     List all crashes where the number of persons injured is greater than the average number of persons injured


select * from collisions 
where `number of persons injured` > 
(select avg(`number of persons injured`) from Collisions );

--    Create a new column that classifies crashes into severity levels:
--    LOW if NUMBER OF PERSONS INJURED < 2.
--    MEDIUM if between 2 and 5.
--    HIGH if > 5.

select *,
CASE 
	when `number of persons injured`<=2 then 'LOW'
    when `number of persons injured`>2 AND  `number of persons injured`<= 5 then 'MEDIUM'
    when `number of persons injured`>5 then 'HIGH'
END as  `SEVERITY LEVEL`
from collisions;
 


