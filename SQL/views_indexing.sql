use [Synthetic E-commerce]
select * from customers;
select * from Products;
select * from Shipments;
select * from order_items;
select * from returns;
select * from orders;
select * from payments;

-- views 

-- there are the small tables 
-- how to create a view 
-- it is a virtual table we can use to have the result stored and then use the data in automation
-- create the customer order summary

create view vw_customer_summary as select 
customer_id,count(order_id) as total_orders,
sum(total_amount) as total_spent,
avg(total_amount) as average_order_value
from orders
group by customer_id;

-- how to run a view 
select * from vw_customer_summary;

create view  vw_customersorders as 
select 
c.customer_id,
c.country,
o.order_id,
o.order_date,
o.status,
o.total_amount
from customers as c
inner join orders as o 
on c.customer_id=o.customer_id;
select * from vw_customersorders;

-- indexing

--- how you will you optimise a slow running sql query
-- we will use indexing here
-- an index in sql find rows more efficently similar to the index at the back of the book
-- without an suitable index sql may need to scan more rows with an appropriate index 
-- finding the rows become more efficent 
-- query running time becomes fast and save memory on a dataset

-- how to create index

create nonclustered index ix_orders_customers_date on orders(customer_id,order_date);
select order_id,order_date,total_amount from orders where customer_id=100 order by order_date desc;