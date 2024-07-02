use hr;


select * from employees;
select * from departments;
select * from jobs;
select * from job_history;
select * from locations;
select * from countries;
select * from regions;

-- Write a query to display the name (first and last ) for those employees who gets more 
-- salary than the employee whose ID is 163.
select first_name,last_name,salary from employees 
where salary>(select salary from employees where employee_id=163);

-- Write a query to display all the information of employess whose salary is within the 
-- range of smallest salary and 2500.
select * from employees where salary between (select min(salary) from employees) and 2500;

-- Write a query to display the name (first and last ),salary,department id,job id 
-- for those employees who works in the 
-- same designation as the employee works whose id is 169.

select employee_id,first_name,last_name,salary,department_id,job_id from employees
where job_id=(select job_id from employees where employee_id=169);

-- Write a query to display the name (first and last ),salary,department id,job id for 
-- those employees who earn such amount of 
-- salary which is the smallest salary of any of the departments.

select salary,department_id from employees where salary in
(select min(salary) from employees) group by department_id;

select first_name,last_name ,salary,department_id,job_id from employees
where salary in (select min(salary) from employees);


-- Write a query to get the details of employees who are managers.
-- select count(employee_id),manager_id from employees group by manager_id;
-- select count(employee_id) from employees;

select * from employees where employee_id in (select manager_id from employees);

-- Write a query to get the details of employees who manage a department.
select * from employees where employee_id in (select manager_id from employees);

-- Write a query to display the department id and the total salary for those 
-- departments which contains at least one employee

select department_id,count(employee_id),sum(salary) from employees where department_id is not null
group by department_id having count(employee_id)>=1;

--  Write a query to display the name (first and last ) and department for 
-- all employees for any existence of 
-- those employees whose salary is more than 3700. 

select employee_id,first_name,last_name,department_id,salary from employees 
where salary in(select salary from employees where salary>3700);

-- Write a query to display all the information of those employees who 
-- did not have any job in the past.
select count(distinct(employee_id)) from job_history;
select * from employees where employee_id not in(select employee_id from job_history);

-- Write a query to display employee name(firstname,lastname),
-- employee_id and job title for all employees whose location is Toronto

select * from locations;
select * from departments where location_id=1800;
select * from employees where department_id=20;

select e.employee_id,e.first_name,e.last_name,j.job_title,l.city,d.department_id
from employees e,departments d,jobs j,locations l
where e.department_id=d.department_id 
and d.location_id=l.location_id
and e.job_id=j.job_id
and l.city='toronto';


