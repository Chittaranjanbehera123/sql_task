create table customers
(
cid int primary key,
cname char(10),
dob date,
address varchar(20),
phno int
);
show tables;
desc customers;
select * from customers;
insert into customers values(1,'rahul','2005-12-5','malad',2035345345);
insert into customers values(2,'seema','2006-10-6','borivali',55345345);
insert into customers values(3,'reema','2000-5-7','vasai',3445345);
insert into customers values(4,'raj','2001-2-3','malad',4345345);
insert into customers values(5,'aakash',null,null,95345345);
select * from customers;


create table orders
(
oid int primary key,
orderdate date,
cid int,
amount float,
qty int,
foreign key(cid) references  customers(cid)
);

insert into orders values(101,'2023-5-5',1,300,2);
insert into orders values(102,'2023-4-4',1,4000,4);
insert into orders values(103,'2023-6-5',2,2000,2);
insert into orders values(104,'2023-7-8',4,1000,5);
insert into orders values(105,'2023-7-8',null,1000,5);
select * from orders;

-- display order details whose qty is 2 but amount is greater than 1000.
select * from orders where  qty>2 and amount>1000;

-- find customers details who placed an order.
select * from customers where cid in(select cid from orders);
select distinct(orders.cid),cname from customers,orders where customers.cid=orders.cid;
select distinct(orders.cid),cname from customers inner join orders on customers.cid=orders.cid;
select distinct(orders.cid),cname from customers natural join orders;
select * from customers where exists (select cid from orders where customers.cid=orders.cid);
select * from customers where cid=any(select cid from orders);

-- display customers who placed an orders only for whose qty is more than 2.
select * from customers where cid in(select cid from orders where qty>2);
select distinct(orders.cid),cname ,qty from customers,orders where customers.cid=orders.cid and qty>2;
select * from customers where exists (select cid from orders where customers.cid=orders.cid and qty>2);

-- find customers details who have not placed an order.
select * from customers where cid not in(select cid from orders where customers.cid=orders.cid);
select * from customers where not exists(select cid from orders where customers.cid=orders.cid);

-- find cutomers details who placed order from 1st May 23 to 30th June 23

select * from customers where cid in(select cid from orders where orderdate between '2023-05-01' and '2023-06-30');
select distinct(orders.cid),cname,orderdate from customers inner join orders on customers.cid=orders.cid and orderdate between '2023-05-01' and '2023-06-30';

-- find cutomers details who placed order and asked for same quantity of product
select o1.cid,customers.cname,o2.qty from orders o1,orders o2,customers where o1.cid<>o2.cid and o1.qty=o2.qty and o1.cid=customers.cid;

-- display customers that are from same city.
select c1.cid,c1.cname,c2.address from customers c1,customers c2 where c1.cid<>c2.cid and c1.address=c2.address;
