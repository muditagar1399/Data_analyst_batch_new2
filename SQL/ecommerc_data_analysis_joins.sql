use [Synthetic E-commerce ]
select * from customers;
-- number of missing values in each column of customer table
select 
count(*)-count(customer_id) as missing_customer_id,
count(*)-count(first_name) as missing_first_name,
count(*)-count(last_name) as missing_last_name,
count(*)-count(email) as missing_email,
count(*)-count(phone) as missing_phone,
count(*)-count(country) as missing_country,
count(*)-count(city) as missing_city,
count(*)-count(signup_date) as  singup_date_missing,
count(*)-count(loyalty_tier) as  missing_loyalty_tier,
count(*)-count(marketing_opt_in) as missinng_marketing_opt_in
from customers;
-- concept of checking the sum of missing values 
--count(*) -- it is counting all the rows
--count(phone)- counts rows where phone is not null 
-- subtracting the number of missing phone values -- the missing values sum 
-- replace the phone numbers with not defined 
update customers set phone='not defined' where phone is null;

select * from customers;
-- the change is happened in actual data 
-- checking duplicates in customer_id column 
select customer_id, count(*) as duplicate_count from customers group by customer_id having count(*)>1;
-- checking for the order_items tables 

select * from order_items;
-- number of missing values 
select 
count(*)-count(order_item_id) as missing_order_item_id,
count(*)-count(order_id) as missing_order_id,
count(*)-count(product_id) as missing_product_id,
count(*)-count(quantity) as missing_quantity,
count(*)-count(unit_price) as missing_unit_price,
count(*)-count(line_total) as missing_line_total
from order_items;
-- replacing nothing becuase no missing value 
-- duplicates checking in three columns 
select order_item_id,order_id,product_id,
count(*) as duplicate_count from order_items
group by order_item_id,order_id,product_id having count(*)>1;
-- checking in orders table
select * from orders;
-- checking the number of mising values
select 
count(*)-count(order_id) as missing_order_id,
count(*)-count(customer_id) as missing_customer_id,
count(*)-count(order_date) as missing_order_date,
count(*)-count(status) as missing_status,
count(*)-count(channel) as missing_channel,
count(*)-count(subtotal) as missing_subtotal,
count(*)-count(discount_amount) as discount_amount_missing,
count(*)-count(shipping_fee) as shipping_fee_missing,
count(*)-count(tax_amount) as missing_tax_amount,
count(*)-count(total_amount) as missing_total_amount,
count(*)-count(currency) as missing_currency
from orders;
-- checking duplicates 
select order_id,customer_id ,count(*)
as duplicate_count from orders group by order_id,customer_id having count(*)>1;
-- payments
select * from payments;
-- checking the number of mising values
select 
count(*)-count(payment_id) as missing_payment_id,
count(*)-count(order_id) as missing_order_id,
count(*)-count(method) as missing_method,
count(*)-count(paid_at) as missing_paid_At,
count(*)-count(status) as missing_status
from payments;

-- duplaicates
select payment_id,order_id ,count(*)
as duplicate_count from payments group by payment_id,order_id having count(*)>1;
-- method type which is used how much time
select method,count(*) as usage_count from payments group by method order by usage_count desc;

-- conersion cast method
select order_id ,cast(paid_at as date ) as paid_at from payments;
alter table payments alter column paid_at datetime2(0);
select * from payments;
-- shipments
select * from shipments;
-- checking missing values 
select 
count(*)-count(shipment_id) as missing_shipment_id,
count(*)-count(order_id) as missing_order_id,
count(*)-count(carrier) as missing_carrier,
count(*)-count(tracking_number) as missing_tracking_number,
count(*)-count(shipped_at) as missing_shipped_at,
count(*)-count(delivered_at) as missing_delivered_at,
count(*)-count(status) as missing_status

from shipments;

update shipments set delivered_at='00:00:00' where delivered_at is null;
-- altering the column type of shipped_At and deleivered at 
alter table shipments alter column shipped_at  date;
alter table shipments alter column delivered_at  date;
select * from shipments;
-- but the cast will not make changes to the table directly 
SELECT ISNULL(cast(delivered_at as varchar(20)), 'No') FROM shipments;
-- products
select * from products;
--missing values
select 
count(*)-count(product_id) as missing_product_id,
count(*)-count(product_name) as missing_product_name,
count(*)-count(category) as missing_category,
count(*)-count(brand) as missing_brand,
count(*)-count(unit_price) as missing_unit_price,
count(*)-count(unit_cost) as missing_unit_Cost,
count(*)-count(weight_kg) as missing_weight,
count(*) -count(is_active) as missing_is_Active,
count(*)-count(created_at) as missing_created_at
from products;
-- replacing the missing weight with avergae of the weight 
update products
set weight_kg=(select avg(weight_kg) from products where weight_kg is not null)
where weight_kg is null;
-- checking duplicates 
select product_id,count(*)
as duplicate_count from products group by product_id having count(*)>1;
-- returns 
-- altering the column requested at
alter table returns alter column requested_at date;

select * from returns ;
select 
count(*)-count(return_id) as missing_return_id,
count(*)-count(order_item_id) as missing_order_item_id,
count(*)-count(reason) as missing_reason,
count(*)-count(refund_amount) as missing_refund_amount,
count(*)-count(requested_at) as missing_requested_At,
count(*)-count(status) as missing_status
from returns;
-- duplicate count
select return_id,order_item_id,count(*)
as duplicate_count from returns group by return_id, order_item_id having count(*)>1;
-- data analysis 
select * from customers;
select * from order_items;
select * from orders;
select * from payments;
select * from products;
select * from returns;
select * from shipments;
-- combining customers, orders and order_items table to see which customers placed orders and what they purchased
select 
c.customer_id,
c.first_name,
c.last_name,
o.order_id,
o.order_date,
o.status,
oi.product_id,
oi.quantity,
oi.line_total
from customers as c
inner join orders as o 
on c.customer_id=o.customer_id
inner join order_items as oi
on o.order_id=oi.order_id;
-- total number of orders
select count(*) as total_orders from orders;
--order by status 
select status,count(*) as total_orders 
from orders 
group by status 
order by total_orders desc;
-- monthly trend for order
-- year , date 
select
year(order_date) as order_year,
month(order_date) as order_month,
count(*) as total_orders 
from orders
group by 
year(order_date),
month(order_date)
order by
order_year,
order_month;
-- analyse the best selling products
-- there is relationship between product_id of products table and orders items
select 
p.product_id,
p.product_name,
p.category,
sum(oi.quantity) as units_Sold,
sum(oi.line_total) as total_Sales
from order_items as oi
inner join products as p
on oi.product_id=p.product_id
group by 
p.product_id,
p.product_name,
p.category
order by units_Sold desc;
-- ques for customers and orders table 
--1. which order status is the most comman
--hint: group by status , count(*) order by
--2. which orders have a subtotal greater than 50000
--hint:where , subtotal>50000, select order_id, subtotal


--3. which sales channel generates the most orders
--hint : group by channel , count(*) order by
--4. which 10 customers placed most orders
--hint: inner join customer with orders on customer_id ; use count(distinct order_id ) and top 10
--5. which countries have the most customers
--6. which customers have never placed an order
--7. what is the total spending per customer
--hint: join customers and orders ; use sum(..) and group by customer details . decide which order status count as valid sales
--8. which loyality tier has the most customers
--hint: group by, loyalty_tier , count(*)