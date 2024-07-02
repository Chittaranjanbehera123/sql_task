use company;

-- sub-query with create

create table customer1 as select * from customers;   -- create as q2 and select as q1
select * from customer1;

-- sub-query with insert
select * from customer1;
start transaction;
delete from customer1;
select * from customer1;
select * from customers;

-- insert into customer1 for customers stay in malad

insert into customer1 select * from customers where address='malad';
select * from customer1;
desc customer1;

-- update into customer1 phone number for customers stay in malad and whose cid is 1
update customer1 set phno=888888 where cid in(select cid from customers where address='malad' and cid=1);
select * from customer1;
select * from customers;

-- delete into customer1 for customers who stay in malad and whose cid is 1
delete from customer1 where cid in(select cid from customers where address='malad' and cid=1);
select * from customer1;
select * from customers;



use hr;

select * from employees;
select * from departments;
select * from jobs;
select * from job_history;
desc job_history;
select * from locations;
select * from countries;
select * from regions;

-- Write a query to display the name (first and last ) for those employees who gets more 
-- salary than the employee whose ID is 163.
-- select first_name,last_name,salary from employees where employee_id=163;  checking
-- select first_name,last_name,salary from employees where salary<9500;  checking

select first_name,last_name,salary from employees where salary >(select salary from employees where employee_id=163);

-- Write a query to display all the information of employess whose salary is within the 
-- range of smallest salary and 2500.
select min(salary) from employees;
select first_name,last_name,salary from employees where salary between (select min(salary) from employees) and 2500;

-- Write a query to display the name (first and last ),salary,department id,job id 
-- for those employees who works in the same designation as the employee works whose id is 169.
select first_name,last_name,salary,department_id,job_id from employees where job_id=(select job_id from employees where employee_id=169);

-- Write a query to display the name (first and last ),salary,department id,job id for 
-- those employees who earn such amount of salary which is the smallest salary of any of the departments.
select first_name,last_name,salary,department_id,job_id from employees where salary in(select min(salary) from employees) group by department_id;

select department_id,job_id,min(salary) from employees group by department_id;

-- Write a query to get the details of employees who are managers.

-- Write a query to get the details of employees who manage a department.

-- Write a query to display the department id and the total salary for those departments which contains at least one employee

-- Write a query to display the name (first and last ) and department for all employees for any existence of 
-- those employees whose salary is more than 3700. 

-- Write a query to display all the information of those employees who 
-- did not have any job in the past.

-- Write a query to display employee name(firstname,lastname),employee_id and job title for all employees whose location is Toronto


