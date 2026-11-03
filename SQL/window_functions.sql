-- roll back and commit 
-- roll back 
-- when you execute a transaction you can roll back you can undo it 
-- commit 
-- once is transaction is commited you cannot rollback it or undo it 
--by defualt in sql if you run any query it is already commited for ex if you create a table and run it 
-- you cannot have the same table it again becuase it is saved so it is by default autocommit 
use [Synthetic E-commerce ]
select * from orders;
-- roll back 
-- go step by step exceution with execute transaction then query and roll back 
begin transaction 
delete from orders where customer_id=1;
rollback 
select * from orders;
-- commit 
-- saved
begin transaction 
select * from orders where total_amount>500;
commit
rollback
-- once you commited you cant roll it back 
-- the execcution will be same as we have in roll back 
-- window function 

-- prefdefined function in sql to make query easier it is used so that we dont spend time on making complex queries 
select * from orders;
-- the functions we can use to perform caluations across a set of related rows without combining them 
-- in simple terms , window functions allow us to calculate rankings,running total , averages , arthemtic 
-- individual record in output and no complex query 

-- ex:
-- suppose customer 1 has placed 5 orders 
-- group by will combine those 5 rows into the result
-- window function can calculate the customers total sales while still presenting all 5 individual rows
-- advantages

--retain individual rows values 
-- to protect from complex queries 
-- we can compare the results of previous records

-- disadvanatges 

-- it can be difficult to understand as compared to other functions 

-- with window functions we will always use over() -- the over() will define the rows of calculations 

-- keywords 
-- over()-- define the window 
--- partition by -- divide rows into groups 
-- order by -- define the order of rows 

-- ex

select 
order_id,
customer_id,
total_amount,
sum(total_amount) over(partition by customer_id ) as customer_total_Sales from orders;
-- types of window functions
-- we are performing all the window functions on orders table
select * from orders;
-- windows functions we have divided into 4 categries
-- aggregate window functions 
-- calculate the values across groups of rows
--sum(),avg(),count(),min(),max()
-- ranking window functions 
-- assign rankings to rows
--ROW_NUMBER(),RANK(),DENSE_RANK(),NTILE()
-- value/navigation window functions 
-- assign values from other rows
--LAG(),LEAD(),FIRST_VALUE(),LAST_VALUE()
-- distributive window functions 
-- calculate relative positions within a group
--PERCENT_RANK(),CUME_DIST()
--aggregate functions: to perform calculations on a set of rows
-- total sales per customer
select order_id,
customer_id,
total_amount,
sum(total_amount) over(partition by customer_id) as customer_total_Sales
from orders;
-- parition by customer_id-- groups calulations by customers 
--max
select order_id,
customer_id,
total_amount,
max(total_amount) over(partition by customer_id) as customer_total_Sales
from orders;
--min
select order_id,
customer_id,
total_amount,
min(total_amount) over(partition by customer_id) as customer_total_Sales
from orders;
--count
select order_id,
customer_id,
total_amount,
count(total_amount) over(partition by customer_id) as customer_total_Sales
from orders;
--avg
select order_id,
customer_id,
total_amount,
avg(total_amount) over(partition by customer_id) as customer_total_Sales
from orders;

-- ranking window functions 
-- ranking the each row based on specified order
--row_number-- it assigns unique value to each row
--rank()-- assigns the same rank to ties values leaving the gaps 
--dense_Rank()-- assigns the same rows but without leavings gaps 
--ntile(n)-- divides rows into equal groups 

-- row number
select order_id,
customer_id,
total_amount,
row_number()over(partition by customer_id order by total_amount desc)
as row_num
from orders;
-- parition by is not used in rank and dense_Rank
--rank()
select order_id,
total_amount,
rank()over(order by total_amount desc) as sales_Rank from orders;
--dense_Rank()
select order_id,
total_amount,
dense_rank()over(order by total_amount desc) as sales_Rank from orders;
-- ntile
select order_id,
total_amount,
ntile(4)over(order by total_amount desc) as sales_Rank from orders;
-- value_navigation window functions 
--lag()-- retrives a value from previous row
-- lead()-- retrives a values from a following row
-- first_value-- retrives a value in a window frame from first value
-- last_value -- retrives the last value in a window frame 
--lag()

select top 10 order_id,
customer_id,
total_amount,
lag(total_amount) over(partition  by customer_id order by order_id)
as previous_order_amount
from orders;
-- lead()
select top 10 order_id,
customer_id,
total_amount,
lead(total_amount) over(partition  by customer_id order by order_id)
as previous_order_amount
from orders;
--first_value
select top 10 order_id,
customer_id,
total_amount,
first_value(total_amount) over(partition  by customer_id order by order_id)
as previous_order_amount
from orders;
--last_value
select top 10 order_id,
customer_id,
total_amount,
last_value(total_amount) over(partition  by customer_id order by order_id)
as previous_order_amount
from orders;
-- ditribution window functions 
-- percent_rank-- calulates the relative rank of a row as a percentage
--percent_rank()
-- rank related functions we dont use parition by there
select order_id, total_amount , percent_rank()over(order by total_amount ) as percentage_Rank from orders;
--- percent rank = rank-1/total_rows-1
--cume_dist()-- it calculates the cumulaitve distrbution of a row
select order_id, total_amount , cume_dist()
over(order by total_amount ) as cumulative_distribution from orders;


--cumulative sum formula 
--CSn=CSn-1+Xn
--where
--CS= current cumulaitve value
--CSn-1=previous cumulaitve value 
-- Xn= current row value
--cum_dist=number of rows with value <=current value/total number of rows
