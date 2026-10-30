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