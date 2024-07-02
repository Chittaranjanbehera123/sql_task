use company;
select * from emp;
select * from manager;

start transaction;
delete from manager;
select * from manager;
rollback;
select * from manager;


delete from manager;
select * from manager;
insert into manager values(1,"raj","male","2003-09-23","hr");
insert into manager values(2,"komal","female","2005-05-3","acc");
insert into manager values(3,"pooja","female","2002-04-23","hr");
insert into manager values(4,"mohit","male","2003-09-20","it");
insert into manager values(5,"manav","male","2001-11-10","sales");
select * from manager;

-- Date functions
select sysdate();  -- date & time
select now(); -- date & time
select curdate(); -- date
select current_date(); -- date
select current_timestamp();  -- date & time
select current_time();
select curtime();  -- date

insert into manager values(6,"sneha","female",curdate(),"sales");
select * from manager;

select day("2022-03-20"); 
select day(now());
select dayname("2022-03-20"); 
select dayname(now()); 
select dayofmonth("2022-03-20"); 
select dayofmonth(now()); 
select dayofweek("2022-03-20"); 
select dayofweek(now()); -- sunday as 1
select dayofyear("2022-03-20"); 
select dayofyear(now()); 

select month("2022-03-20");
select month(now());
select monthname("2022-03-20");
select monthname(now());

select year('2022-03-20');
select year(now());
select yearweek('2022-03-20');  -- 12
select yearweek(now());  -- year and weeks number (45)

select week('2022-03-20');  -- 12
select week(now()); -- 45
select weekday('2022-03-20');
select weekday(now()); -- monday as 0
select weekofyear('2022-03-20');  -- 11
select weekofyear(now());    -- 45

-- display manager details whose birthday on november month
select * from manager where monthname(dob)='november';
select * from manager where month(dob)=11;

-- display all manager's age as per given birthday
select mname,dob,year(now())-year(dob) as 'Age' from manager;

-- display manager details of manager whose birthday in year 2003
select * from manager where year(dob)=2003;

-- display manager details who are turning up age of 21.
select mname,dob,year(now())-year(dob) as 'Age' from manager where year(now())-year(dob)=21;

-- display manager whose birthday's are in next month
-- display manager whose birthday's are in next week

select date_add('2022-03-22', interval 30 day);
select date_add('2022-03-22', interval 30 month);
select date_add('2022-03-22', interval 30 year);

select adddate(now(),3);

select date_sub('2022-03-22', interval 30 day);
select date_sub('2022-03-22',interval 30 month);
select date_sub('2022-03-22',interval 30 year);
select date_sub(now(), interval 30 day);

select datediff('2022-03-22',now());
select datediff(now(),'2022-03-22');

-- display manager whose birthday's are in next week
insert into manager values(7,"manoj","male","2005-11-17","sales");
select * from manager;
select * from manager where week(dob)=week(now())+1;

-- display manager whose birthday's are in next month
insert into manager values(8,"rahul","male","2002-12-1","hr");
select * from manager where month(dob)=month(now())+1;

-- data_format()
select date_format("2022-03-22","%D/%M/%Y");
select date_format("2022-03-22","%d/%M/%Y");
select date_format("2022-03-22","%D/%m/%Y");
select date_format("2022-03-22","%D/%M/%y");

select mname,dob,date_format(dob,"%D %M %Y") as 'DateofBirth' from manager;
select date_format("2022-03-22 12:56:23","%D-%M-%Y %T");

select time("2022-03-22 12:56:23");
select time(now());
select hour("2022-03-22 12:56:23");
select hour(now());
select minute("2022-03-22 12:56:23");
select minute(now());
select second("2022-03-22 12:56:23");
select second(now());
