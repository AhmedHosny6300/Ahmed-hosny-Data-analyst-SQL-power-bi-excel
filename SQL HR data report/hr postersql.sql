select * from hrdata limit 8 ;

select count(employee_count) as num_of_emp from hrdata 

select count(attrition) as attrition_cases from hrdata  where attrition ='Yes' ;

select round((select count(attrition) from hrdata where attrition = 'Yes')/ 
sum(employee_count)*100,2) as attrition_rate
from hrdata;

--active emp
select count(active_employee)as active_employees from hrdata
where active_employee = 1 ;

--average age rounded 
select round(avg (age),0)as average_Age from hrdata;

--attrition by gender 
select gender , count(attrition) as Attrition from hrdata where attrition ='Yes'
group by gender;

--attrition cases per department 
select department , count(attrition) as Attrition from hrdata where attrition ='Yes'
group by department
order by count(attrition) desc;

--no of employees by age group 
select age_band , count(employee_count) as num_of_emp from hrdata
group by age_band
order by count(employee_count) desc;

--no of emp by age 
select age , count(emp_no) as num_of_emp from hrdata 
group by age 
order by count(emp_no) desc;

--attrition according to education 
select education , count(attrition) from hrdata 
where attrition = 'Yes'
group by education 
order by count(attrition) desc;

--attrition according to education field
select education_field , count(attrition) from hrdata 
where attrition = 'Yes'
group by education_field
order by count(attrition) desc;

--attrition by gender and different age group  
select age_band , count(attrition) as Attrition, gender ,
round((cast(count(attrition)as numeric)/
(select count(attrition) from hrdata where attrition ='Yes'))*100 ,2) as percentage 
from hrdata where attrition ='Yes'
group by age_band , gender
order by age_band;

select * from 
crosstab('select job_role ,job_satisfaction,sum(employee_count)
		from hrdata
		 group by job_role,job_satisfaction
		 order by job_role,job_satisfaction')
		 As crosstab (job_role varchar(30),one_star numeric , two_stars numeric,three_stars numeric , four_stars numeric)
		 order by job_role;

--CREATE EXTENSION IF NOT EXISTS TABLEFUNC;














