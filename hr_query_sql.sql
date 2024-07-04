SELECT * FROM project1.hr;

DESCRIBE HR;
SELECT BIRTHDATE FROM HR;
select emp_id from hr where location_state="Ohio" ;
use project1;


SET sql_safe_updates = 0;
update hr
set birthdate=CASE
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;
SELECT BIRTHDATE FROM HR;

alter table hr
modify column birthdate date;

DESCRIBE HR;

update hr
set hire_date=CASE
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;
select hire_date from hr;

alter table hr
modify column hire_date date;

select termdate from hr;
UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

select termdate from hr;



select termdate from hr;



UPDATE hr
SET termdate = NULL
WHERE termdate = '0000-00-00' OR termdate = '';
select termdate from hr;

alter table hr
modify column termdate DATE;

UPDATE hr
SET termdate = '0000-00-00'
WHERE termdate IS NULL OR termdate = '';

alter table hr add column age int;
select * from hr;

update hr
set age= timestampdiff(year,birthdate, curdate());

select birthdate,age from hr;
select termdate from hr;
select count(*) from hr where age<21;

describe hr;
select first_name from hr where termdate is NULL;
-- question I solve by SQL 
-- 1. What is the gender breakdown of employess in the company?
select gender, count(*) as count
from hr 
where termdate is NULL
group by gender; 

-- 2. What is the race/ethnicity breakdown of employess?
select race, count(*) as count
from hr
where termdate is NULL
group by race
order by count desc;

-- 3. What is the age distributon of employees?
select 
	min(age) as youngest,
    max(age) as oldest
from hr
where termdate is null;


select 
	case
		when age>=20 and age<=24 then '20-24'
        when age>=25 and age<=29 then '25-29'
        when age>=30 and age<=34 then '30-34'
        when age>=35 and age<=39 then '35-39'
        when age>=40 and age<=44 then '40-44'
        when age>=45 and age<=49 then '45-49'
		when age>=50 and age<=54 then '50-54'
        else '55+'
end  
as age_group, count(*) as count
from hr
where termdate is null 
group by age_group
order by age_group;

-- based on gender
select 
	case
		when age>=20 and age<=24 then '20-24'
        when age>=25 and age<=29 then '25-29'
        when age>=30 and age<=34 then '30-34'
        when age>=35 and age<=39 then '35-39'
        when age>=40 and age<=44 then '40-44'
        when age>=45 and age<=49 then '45-49'
		when age>=50 and age<=54 then '50-54'
        else '55+'
end as age_group, gender, count(*) as count
from hr
where termdate is null 
group by age_group,gender
order by age_group,gender;  

-- 4. How many employees work at headquarter versus remote locations?
select location, count(*) as count
from hr
where termdate is null
group by location;

-- 5. what is the average length of employment for employees who have been terminated?
select 
	round(avg(datediff(termdate,hire_date))/365,0) as avg_length_employment_in_years
from hr
where termdate<=curdate() and termdate is not null;
    
-- 6. How does the gender distribution vary across departments?
select department, gender,count(*) as count
from hr
where termdate is null
group by department,gender
order by department;

-- 7. what is the distributon of job titles across the company?
select jobtitle, gender,count(*) as count
from hr
where termdate is null
group by jobtitle,gender
order by jobtitle;
-- 8. which department has the highest turnover rate?
select department,
	total_count,
    terminated_count,
    terminated_count/total_count as termination_rate
from(
select department,
count(*) as total_count,
sum(case when termdate is not null and termdate <=curdate() then 1 else 0 end) as terminated_count
from hr
group by department
) as subquery
order by termination_rate desc;
-- 9. what is the distribution of employees across location by city and state?
select location_state, count(*) as count
from hr
where termdate is null
group by location_state
order by count desc;

-- 10. How has the company's employee count changed over time based on hire and term date?

select 
    year,
    hires,
    terminations,
    hires - terminations AS net_change,
    ROUND((hires - terminations) / hires * 100, 2) AS net_change_percent
FROM (
    SELECT 
        YEAR(hire_date) AS year,
        COUNT(*) AS hires,
        SUM(CASE WHEN termdate IS NOT NULL AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
    FROM hr
    GROUP BY YEAR(hire_date)
) AS subquery
ORDER BY year ASC;
 
    
-- 11. What is the tenure distribution for each department?
select department, round(avg(datediff(termdate, hire_date)/365),0) as avg_tenure
from hr
where termdate is not null and termdate<=curdate()
group by department
order by department;