---  display all columns of the dataset
select * from collisions;

-- total number of rows in the collisions
select count(*) from collisions;

-- display only selected columns
select crash date, borough from collisions;  ## returns error because the column 'crash date' contains spaces

-- In SQL, column names are typically treated as a single word or identifier. 
-- If the column name contains spaces (like "crash date"), SQL does not recognize this as a single identifier. 
-- Instead, it treats it as two separate tokens: crash and date.

-- To correctly reference a column with spaces or special characters, you need to use delimiters around the column name.
-- These delimiters tell the database that everything inside the quotes or backticks should be treated as a single identifier, even if it contains spaces or other characters.

select `crash date`, borough from collisions;


-- retrieving all records where the BOROUGH is "Brooklyn".
select * from collisions where borough = 'Brooklyn';

-- crashes that occurred on ON STREET NAME = "SARATOGA AVENUE".
select * from collisions where `on street name` = 'SARATOGA AVENUE';



-- display crashes sorted by CRASH DATE in descending order.
select * from collisions 
order by `crash date` desc;



-- top 10 most recent crashes.

select * 
from collisions 
order by  `CRASH DATE` desc, `CRASH TIME` desc 
limit 10;


-- list all unique BOROUGH values.
select distinct borough  from collisions;


-- number of distinct VEHICLE TYPE CODE 1 values.
select count(distinct `vehicle type code 1`) from collisions;


-- retrieve records where  borough is null
select * from collisions where borough is null;

-- replace null values with unknown 
update collisions
set  borough = 'Unknown'
where borough is null;

-- replace all null values with 'unknown' in every column of the table.

UPDATE collisions
SET 
    `ZIP CODE` = COALESCE(`ZIP CODE`, 'Unknown'),
    LATITUDE = COALESCE(LATITUDE, -1),
    LONGITUDE = COALESCE(LONGITUDE, -1),
    LOCATION = COALESCE(LOCATION, 'Unknown'),
    `ON STREET NAME` = COALESCE(`ON STREET NAME`, 'Unknown'),
    `CROSS STREET NAME` = COALESCE(`CROSS STREET NAME`, 'Unknown'),
    `OFF STREET NAME` = COALESCE(`OFF STREET NAME`, 'Unknown'),
    `NUMBER OF PERSONS INJURED` = COALESCE(`NUMBER OF PERSONS INJURED`, -1),
    `CONTRIBUTING FACTOR VEHICLE 1` = COALESCE(`CONTRIBUTING FACTOR VEHICLE 1`, 'Unknown'),
    `CONTRIBUTING FACTOR VEHICLE 2` = COALESCE(`CONTRIBUTING FACTOR VEHICLE 2`, 'Unknown'),
    `CONTRIBUTING FACTOR VEHICLE 3` = COALESCE(`CONTRIBUTING FACTOR VEHICLE 3`, 'Unknown'),
    `CONTRIBUTING FACTOR VEHICLE 4` = COALESCE(`CONTRIBUTING FACTOR VEHICLE 4`, 'Unknown'),
    `CONTRIBUTING FACTOR VEHICLE 5` = COALESCE(`CONTRIBUTING FACTOR VEHICLE 5`, 'Unknown'),
    `VEHICLE TYPE CODE 1` = COALESCE(`VEHICLE TYPE CODE 1`, 'Unknown'),
    `VEHICLE TYPE CODE 2` = COALESCE(`VEHICLE TYPE CODE 2`, 'Unknown'),
    `VEHICLE TYPE CODE 3` = COALESCE(`VEHICLE TYPE CODE 3`, 'Unknown'),
    `VEHICLE TYPE CODE 4` = COALESCE(`VEHICLE TYPE CODE 4`, 'Unknown'),
    `VEHICLE TYPE CODE 5` = COALESCE(`VEHICLE TYPE CODE 5`, 'Unknown');
    
