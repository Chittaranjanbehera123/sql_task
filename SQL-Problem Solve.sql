-- create database company1;
create database company;
use company;
create table areas
(
area_id int,
area_name varchar(20),
city varchar(20)
);
desc areas;
create table workers
(
worker_id int,
first_name varchar(20),
last_name varchar(20),
email varchar(20),
hiredate date,
salary int,
manager_id int,
commission int,
section_id int
);
desc workers;
create table sections
(
section_id int,
section_name varchar(20),
manager_id int,
area_id int
);
desc sections;
alter table areas add primary key(area_id);
desc areas;
alter table workers add primary key(worker_id);
desc workers;
alter table sections add primary key(section_id);
desc sections;

-- Fk
alter table workers add constraint foreign key(manager_id) references workers(worker_id);
alter table workers add constraint foreign key(section_id) references sections(section_id);
show create table workers;
show index from workers;

alter table sections add constraint foreign key(manager_id) references workers(worker_id);
alter table sections add constraint foreign key(area_id) references areas(area_id);
show create table sections;
show index from sections;

insert into areas values(1,'borivali','mumbai');
insert into areas values(2,'khed','pune');
insert into areas values(3,'rajkot','delhi');

insert into sections(section_id,section_name,area_id) values(101,'manufacturer',1);
insert into sections(section_id,section_name,area_id) values(102,'IT',2);
insert into sections(section_id,section_name,area_id) values(103,'Sales',2);

insert into workers values(1001,'raj','sharma','raj@gmail.com','2009-01-01',80000,null,10000,101);
insert into workers values(1002,'suman','gupta','suman@gmail.com','2011-03-01',50000,1001,5000,null);
insert into workers values(1003,'rohit','more','rohit@gmail.com','2015-04-01',40000,1001,3000,null);
select * from areas;
select * from workers;
select * from sections;

update sections set manager_id=1001 where section_id in(101,103);
select * from sections;

-- Display the last name and salary for all workers whose salary is not equal to 25000,35000 or 70000
select last_name,salary 
from workers 
where salary not in (25000,35000,70000);

-- List the name of all the workers who have joined after '1 january 2010'
select first_name,hiredate 
from workers 
where hiredate>'2010-01-01';

-- Write  query to display the last name, section id and section name for all workers.
select last_name,workers.section_id,section_name 
from workers,sections 
where workers.section_id=sections.section_id;

-- Display the workers name along with their manager name
select * from workers;

select w.first_name as 'Manager Name',m.first_name as 'Worker Name',m.manager_id
from workers w,workers m
where w.worker_id=m.manager_id and w.first_name!=m.first_name;

-- Determine the number of managers without listing them.Label the column number of managers.
select count(distinct(manager_id))  as 'Number of managers' from workers;