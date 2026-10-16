use [Synthetic E-commerce ]
--customers
select * from customers;
-- order_items
select * from order_items;
-- there is no comman column between customers and order_items so there is no relationship no join can be applied
-- orders
select * from orders;
-- there is comman column of cust_id and order_id so there is relationship between these two tables with orders tables
-- payements
select * from payments;
-- payment has relation between orders tables order_id
-- returns 
select * from returns;
--returns table has relationship between order_item_id so it can be joined with order_item
--shipements
select * from shipments;
-- shipement has relationship between orders_Table