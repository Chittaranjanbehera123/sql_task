use company;
select * from emp;

-- find employees count for male and female
select count(*) from emp;
select * from emp;
select count(gender) from emp;

select gender,count(gender) from emp group by gender;

select gender,count(id) from emp group by gender;

-- find employees count for male and female except null entry
select gender,count(id) from emp where gender is not null  and gender!='' group by gender;
select gender,count(id) from emp  group by gender having gender is not null;

-- find count of male employeess.
select gender,count(id) from emp where gender='male' group by gender;
select gender,count(id) from emp  group by gender having gender='male';

-- find employes count as per cities show whose count is above one
select address,count(id) from emp group by address;
-- select address,count(id) from emp where count(address)>1 group by address;  --error because of where
select address,count(id) from emp  group by address having count(address)>1; 

-- find manager count as per age.
select * from manager;
select year(now())-year(dob) from manager;
select year(now())-year(dob) as 'age',count(mid) from manager group by  age order by count(mid);
select year(now())-year(dob) as 'age',count(mid) from manager group by  age ;

-- find employess total salary as per gender.
select gender,sum(salary),count(id) from emp group by gender;
select gender,sum(salary), count(id) from emp group by gender having gender is not null;

-- find employess total salary as per cities.
select count(*) from emp;
select count(distinct(address)) from emp;
select address,sum(salary), count(id) from emp group by address having address is not null;


-- Foreign Key

create table student
(
sid int,
sname char(20)
);

create table teacher
(
tid int,
tname char(20)
);

insert into student values(1,'raj');
insert into student values(2,'pooja');
insert into student values(3,'neha');

select * from student;

insert into teacher values(101,'seema');
insert into teacher values(102,'anu');
insert into teacher values(103,'rahul');
insert into teacher values(104,'dipak');

select * from teacher;


















