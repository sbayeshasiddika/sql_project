
-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values
select * from `corona virus dataset` where Confirmed is null;
select * from `corona virus dataset` where Deaths is null;
select * from `corona virus dataset` where Recovered is null;
--Q2. If NULL values are present, update them with zeros for all columns.
UPDATE `corona virus dataset`
SET Confirmed = COALESCE(confirmed, 0),
    Deaths = COALESCE(Deaths, 0),
    Recovered = COALESCE(Recovered, 0),
WHERE Confirmed IS NULL OR Deaths IS NULL OR Recovered IS NULL;
-- Q3. check total number of rows
select count(*) from `corona virus dataset`;
-- Q4. Check what is start_date and end_date
SELECT  min( Date) as start_date
FROM `corona virus dataset`;

select max(Date) as end_date
from `corona virus dataset`;
-- Q5. Number of month present in dataset
SELECT COUNT(DISTINCT (Date)) As num_months
FROM `corona virus dataset`;
-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT 
    Date AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM 
    `corona virus dataset`
GROUP BY Date;
-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    MODE() WITHIN GROUP (ORDER BY Confirmed) AS most_frequent_confirmed,
    MODE() WITHIN GROUP (ORDER BY Deaths) AS most_frequent_deaths,
    MODE() WITHIN GROUP (ORDER BY Recovered) AS most_frequent_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    DATE_FORMAT(Date, '%Y-%m');
-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT 
    YEAR(Date) AS year,
    MIN(Confirmed) AS min_confirmed,
    MIN(Deaths) AS min_deaths,
    MIN(Recovered) AS min_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    YEAR(date);
-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT 
    YEAR(date) AS year,
    MAX(Confirmed) AS max_confirmed,
    MAX(Deaths) AS max_deaths,
    MAX(Recovered) AS max_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    YEAR(Date);
-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    SUM(Confirmed) AS total_confirmed,
    SUM(Deaths) AS total_deaths,
    SUM(Recovered) AS total_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    DATE_FORMAT(Date, '%Y-%m');
-- Q11. Check how corona virus spread out with respect to confirmed case
--  (Eg.: total confirmed cases, their average, variance & STDEV )
-- Calculate total confirmed cases
SELECT 
    COUNT(*) AS total_confirmed_cases,
    AVG(Confirmed) AS average_confirmed_cases,
    VARIANCE(Confirmed) AS variance_confirmed_cases,
    STDDEV(Confirmed) AS std_dev_confirmed_cases
FROM 
    `corona virus dataset`;
-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    COUNT(*) AS total_death_cases,
    AVG(Deaths) AS average_death_cases,
    VARIANCE(Deaths) AS variance_death_cases,
    STDDEV(Deaths) AS std_dev_death_cases
FROM 
    `corona virus dataset`
GROUP BY 
    DATE_FORMAT(Date, '%Y-%m');
-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    COUNT(*) AS total_recovered_cases,
    AVG(Recovered) AS average_recovered_cases,
    VARIANCE(Recovered) AS variance_recovered_cases,
    STDDEV(Recovered) AS std_dev_recovered_cases
FROM 
    `corona virus dataset`;
-- Q14. Find Country having highest number of the Confirmed case
SELECT 
    `Country/Region`,
    MAX(Confirmed) AS highest_confirmed_cases
FROM 
    `corona virus dataset`
    group by `Country/Region`;
-- Q15. Find Country having lowest number of the death case
SELECT 
    `Country/Region`,
    MIN(deaths) AS lowest_death_cases
FROM 
    `corona virus dataset`
    group by `Country/Region`;
-- Q16. Find top 5 countries having highest recovered case
SELECT 
    `Country/Region`,
    SUM(Recovered) AS total_recovered_cases
FROM 
    `corona virus dataset`
GROUP BY 
    `Country/Region`
ORDER BY 
    total_recovered_cases DESC
LIMIT 5;
commit;


