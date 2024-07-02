use batch408;
show tables;
select * from student2;

insert into student2 values(4,'seema',null,null);
insert into student2 values(5,'mohit','dfdg','dfdg');
select * from student2;

#add new column as password and set password as qwerty@123 for all students
desc student2;
alter table student2 add password varchar(20);
desc student2;
select * from student2;

#updating password for all students
update student2 
set password="qwerty@123";
select * from student2;

#update city of student id 2 set city as 'delhi'
desc student2;
select * from student2;
update student2 set city='delhi' where sid=2;
select * from student2;

#update gender and city of student id 4 set gender as 'female' and city as 'delhi'.
select * from student2;
update student2 
set city='delhi',
gender='female'  where sid=4;
select * from student2;

insert into student2 values(5,'kajal',null,null,null);
insert into student2 values(6,null,null,null,null);
insert into student2 values(null,null,null,null,null);
insert into student2 values(7,'hitesh',null,'dsfsd','sdsf');
insert into student2 values();
select * from student2;

#update gender of mohit, kajal and hitesh
update student2 set gender='male' where fname in ('mohit','hitesh');
select * from student2;
update student2 set gender='female' where fname in ('kajal');
select * from student2;

#update null values row 
update student2 set sid=8,fname='riya',gender='female' where sid is null; 
select * from student2;

#update city for sid 4,5,8 set city as gujrat
update student2 set city='gujrat' where sid=4 or sid=5 or sid=6;
select * from student2;

#deleting rows

create table student3 as select * from student2;
select * from student3;
#delete record of student id=3
delete from student3 where sid=3;
select * from student3;

#delete record of student id=8
delete from student3 where sid=8;
select * from student3;

#delete record of sid 1,4,5 
delete from student3 where sid in(1,4,5);
select * from student3;

select database();



















