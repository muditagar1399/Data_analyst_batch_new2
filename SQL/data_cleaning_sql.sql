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






