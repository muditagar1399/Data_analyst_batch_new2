-- Joins in SQL 
-- inner join 
--left join (left outer join)
-- right join (right outer join )
-- full outer join 

-- customers
create database joins2
create table cust(
cust_id int primary key,
cust_name varchar(30),
city varchar(30)
);
-- orders 
create table order3(
order_id int primary key,
cust_id int,
product_name varchar(50),
amount int,
foreign key (cust_id) references cust(cust_id)
);
-- inserting data into customers table
insert into cust (cust_id,cust_name,city) values 
(101,'mudit','jaipur'),
(102,'anil','udaipur'),
(103,'harshal','mumabi'),
(104,'zeenia','lucknow');

-- inserting the data into order1
-- cust_id is comman the data should be same in both tables 
insert into order3 (order_id,cust_id,product_name,amount) values
(121,101,'laptop',550000),
(122,102,'camera',10000),
(123,103,'makeup',7000),
(124,104,'mobile',15000);

select * from cust;
select * from order3;
-- inner join 
-- only give matching records from boht table 
-- alias keywords 
-- whenever we are giving a colunn name to a table we use alias keyword 
select c.cust_name,c.city,o.product_name,o.amount from cust c 
inner join order3 o on c.cust_id=o.cust_id;
-- inner join is giving matching records for ex in this case customers and orders1 all ids weere present but for ex 105 customer_id 

delete from order3 where order_id=124;

-- left join 
-- left side all data right table matching side 
-- every customer appers even if they have not placed an order 
select c.cust_name,c.city,o.product_name,o.amount from cust c 
left join order3 o on c.cust_id=o.cust_id;
-- right join all data from right and only matching from left 
select c.cust_name,c.city,o.product_name,o.amount from cust c 
right join order3 o on c.cust_id=o.cust_id;
-- full outer join 
select c.cust_name,c.city,o.product_name,o.amount from cust c 
full outer join order3 o on c.cust_id=o.cust_id;

-- full outer join will give you all data weather it is amtching is matching 

-- cross join 
-- combinations 
select c.cust_name , o.product_name from cust c cross join order3 o;

-- we want to apply now the analysis on the joins 

-- we want to the orders amount more than 10000(where)
select * from order3 where amount>10000;
-- joins (order and group by)
select c.cust_name , sum(o.amount) as total_amount from cust c inner join order3 o on c.cust_id=o.cust_id group by 
c.cust_id,c.cust_name order by total_amount desc;