--   For each BOROUGH, rank the streets (ON STREET NAME) by the number of crashes.
SELECT
	BOROUGH,
    `ON STREET NAME`,
    COUNT(*) AS `NUMBER OF CRASHES`,
    RANK() OVER (PARTITION BY BOROUGH ) AS STREET_RANK
FROM 
	Collisions
GROUP BY 
    1,2
ORDER BY 
	1,STREET_RANK;
    
--    Calculate the running total of crashes by CRASH DATE.
SELECT 
	`CRASH DATE`,
     SUM(COUNT(*)) OVER (ORDER BY `CRASH DATE`) AS RUNNING_TOTAL
FROM 
	Collisions
GROUP BY 1
ORDER BY 1;

--    Use a CTE to find the top 3 most common contributing factors (CONTRIBUTING FACTOR VEHICLE 1).
WITH TOP_3 AS
	(SELECT  `CONTRIBUTING FACTOR VEHICLE 1` ,COUNT(*)
    FROM COLLISIONS
    GROUP BY 1
    ORDER BY 2 DESC)
SELECT * 
FROM TOP_3 
LIMIT 3;
	
--    Find the percentage of crashes where at least one pedestrian was injured compared to total crashes.
Select 
	(count(case when `number of pedestrian injured`>0 then  1 end)/count(*) *100) as `pedestrian injured`
from 
	collisions;