use company;
select * from student;
desc student;

create table marks
(
sid int,
totalmarks float,
foreign key(sid) references student(sid)
);
desc marks;

insert into marks values(1,89),(3,70),(4,98);
select * from marks;

-- find students whose marks are better than student id 1.
select * from student;
select * from marks;  

-- select * from marks where sid=1;
-- select student.sid,student.sname,marks.totalmarks from student,marks
-- where marks.totalmarks>89 and student.sid=marks.sid;

select student.sid,student.sname,marks.totalmarks from student,marks
where student.sid=marks.sid and marks.totalmarks > (select totalmarks from marks where sid=1);

-- find students name and id whose are present and lesser than average of all students.
-- select avg(totalmarks) from marks;
-- select student.sid,student.sname,marks.totalmarks from student,marks
-- where marks.totalmarks<85.667 and student.sid=marks.sid;

select student.sid,student.sname,marks.totalmarks from student,marks
where student.sid=marks.sid and marks.totalmarks<(select avg(totalmarks) from marks);

-- find students name and id whose are present and similar to average of all students.
select student.sid,student.sname,marks.totalmarks from student,marks
where student.sid=marks.sid and marks.totalmarks=(select avg(totalmarks) from marks);

insert into student values(2,"dipa");
insert into student values(5,"hitesh");
select * from student;

insert into marks values(2,null);
select * from marks;

-- find students whose marks are present.
select student.sid,student.sname,marks.totalmarks from student,marks
where student.sid=marks.sid and marks.totalmarks in(select totalmarks from marks where totalmarks is not null);

-- find students whose record is not present in marks.
select student.sid,student.sname from student
where student.sid not in(select sid from marks);

-- find student whose marks are not assigned.
select student.sid,student.sname from student,marks
where student.sid=marks.sid and student.sid in(select sid from marks where totalmarks is null)
union
select student.sid,student.sname from student
where student.sid not in(select sid from marks);


















