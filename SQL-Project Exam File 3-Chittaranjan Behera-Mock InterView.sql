show databases;
show schemas;
create database art_gallary;
use art_gallary;

# Creating tables paintings,artists,sales and collectors 
create table artists(
    id int primary key,
    first_name varchar(20),
    last_name varchar(20)
);
desc artists;
select * from artists;
create table paintings(
	id int primary key,
	name varchar(20),
    artist_id int,
    listed_price float,
    foreign key(artist_id) references artists(id)
);
desc paintings;
select * from paintings;
create table collectors (
    id int primary key,
    first_name varchar(20),
    last_name varchar(20)
);
desc collectors;
select * from collectors;
create table sales(
    id int primary key,
    date date,
    painting_id int,
    artist_id int,
    collector_id int,
    sales_price float,
    foreign key (painting_id) references paintings(id),
    foreign key (artist_id) references artists(id),
    foreign key (collector_id) references collectors(id)
);
desc sales;
select * from sales;
# Inserting data into tables created above

insert into artists (id, first_name, last_name) values
    (1, 'Thomas', 'Black'),
    (2, 'Kate', 'Smith'),
    (3, 'Natali', 'Wein'),
    (4, 'Francesco', 'Benelli');
select * from artists;

insert into paintings (id, name, artist_id, listed_price) values
    (11, 'Miracle', 1, 300.00),
    (12, 'Sunshine', 1, 700.00),
    (13, 'Pretty woman', 2, 2800.00),
    (14, 'Handsome man', 2, 2300.00),
    (15, 'Barbie', 3, 250.00),
    (16, 'Cool painting', 3, 5000.00),
    (17, 'Black square #1000', 3, 50.00),
    (18, 'Mountains', 4, 1300.00);
select * from paintings;

insert into collectors (id, first_name, last_name) values
    (101, 'Brandon', 'Cooper'),
    (102, 'Laura', 'Fisher'),
    (103, 'Christina', 'Buffet'),
    (104, 'Steve', 'Stevenson');
select * from collectors;

insert into sales (id, date, painting_id, artist_id, collector_id, sales_price) values
    (1001, '2021-11-01', 13, 2, 104, 2500.00),
    (1002, '2021-11-10', 14, 2, 102, 2300.00),
    (1003, '2021-11-10', 11, 1, 102, 300.00),
    (1004, '2021-11-15', 16, 3, 103, 4000.00),
    (1005, '2021-11-22', 15, 3, 103, 200.00),
    (1006, '2021-11-22', 17, 3, 103, 50.00);
select * from sales;




-- [11:15 am, 01/12/2023] Priya Jadhav: Q.1 We want to list paintings that are priced higher than the average. 
-- Q.2 we want to list all collectors who purchased paintings from our gallery. 
-- Q3 we want to see the total amount of sales for each artist who has sold at least one painting in our gallery. 
-- Q.4  we want to calculate the number of paintings purchased through our gallery. 
-- Q.5 we want to show the first names and the last names of the artists who had zero sales with our gallery.
-- [11:47 am, 01/12/2023] Priya Jadhav: Q.6 Find painting name who has lowest listing price.
-- Q.7 Find painting id whose sales happens between 1st nov 2021 to 15th nov 2021.
-- Q.8 Show painting deatils whose name ends with 'n'
-- Q.9 Display collectors id whose name is 'Laura'
-- Q.10 Find sales details of artists whose id is 2
-- Q.11 Find count of sales happens for collector id 103.
-- [0:05 pm, 01/12/2023] Priya Jadhav: Q.12 update artists name of artists id 3 set first name as 'zika'
-- Q.13 Change column name of collectors set first_name to fname and last_name to lname.
-- Q.14 Delete painting details whose id is 18
-- Q.15 detele complete data of sales.

-- Q.1 We want to list pintings that are priced higher than the average?
-- Ans: 
SELECT id,name listed_price 
FROM paintings 
where listed_price > (SELECT AVG(listed_price) FROM paintings);

-- Q.2 We want to list all collectors who purchased paintings from our gallery?
-- Ans: 
SELECT id,fname
FROM collectors 
WHERE id IN (SELECT DISTINCT collector_id FROM sales);

-- Q3 we want to see the total amount of sales for each artist who has sold at least one painting in our gallery. 
-- Ans:
select artists.id, artists.first_name, artists.last_name, 
sum(sales.sales_price) as 'total amountof sales'
from artists 
inner join sales 
on sales.artist_id = artists.id group by id;
select * from artists;
select * from sales;

-- Q.4  we want to calculate the number of paintings purchased through our gallery. 
-- Ans: 
SELECT COUNT(*) AS total_paintings_purchased
FROM sales;

-- Q.5 we want to show the first names and the last names of the artists who had zero sales with our gallery.
-- Ans:
SELECT first_name,last_name
from artists
WHERE id NOT IN (SELECT id FROM sales);

-- Q.6 Find painting name who has lowest listing price.
SELECT id
from paintings
ORDER BY listed_price
LIMIT 1;

-- Q.7 Find painting id whose sales happens between 1st nov 2021 to 15th nov 2021.
SELECT DISTINCT id
FROM sales
WHERE date BETWEEN '2021-11-01' AND '2021-11-15';

-- Q.8 Show painting deatils whose name ends with 'n'
SELECT *
FROM paintings
WHERE name LIKE '%n';

-- Q.9 Display collectors id whose name is 'Laura'
select *
FROM  paintings
where name LIKE '%n';

-- Q.10 Find sales details of artists whose id is 2
select *
FROM sales
WHERE id = 2;

-- Q.11 Find count of sales happens for collector id 103.
SELECT COUNT(*) AS sales_price
from sales
WHERE id = 103;

-- Q.12 update artists name of artists id 3 set first name as 'zika'
UPDATE artists
SET first_name = 'Zika'
WHERE id=3;

-- Q.13 Change column name of collectors set first_name to fname and last_name to lname.
ALTER TABLE collectors
CHANGE COLUMN first_name fname VARCHAR(255),
CHANGE COLUMN last_name lname VARCHAR(255);

-- Q.14 Delete painting details whose id is 18
DELETE FROM paintings
WHERE id = 18;

-- Q.15 detele complete data of sales.
DELETE FROM sales;
select * from sales;