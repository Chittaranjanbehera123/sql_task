create database assignment;
use assignment;
show tables;
show schemas;
# Creating table students
create table students(
	id int primary key auto_increment,
    name varchar(20) not null,
    address varchar(20) not null,
    phone_no bigint not null unique,
	percentage float  not null
);
show tables;
desc students;

# Adding data to the products table
insert into students(name,address,phone_no,percentage) values
('Rahul','Agra',9557806625,85),
('Ankit','Delhi',8855664471,75),
('Shailendra','Noida',7213457896,92);
select * from students;

# 1.Retrieve student id, student name, address, and percentage of all those students who scored more than 80 percent.
select id,name,address,percentage from students where percentage > 80;
select * from students;

# 2.Update the percentage of Rahul by 2 percent.
update students set percentage = percentage + 2 where name = 'Rahul';
select * from students;

# 3.Student Ankit has left the school, so delete the whole record of him from the table.
delete from students where name = 'Ankit';
select * from students;

