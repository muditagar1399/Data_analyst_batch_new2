use online_Sales;

select * from train;

-- data analysis 

-- where - filtering 
-- order by -- sorting 
-- group by --- grouping for ex if you want to see category based on sales so we have to group the category with sales basically 
-- in group by we group only the numerical column based on some aggregation 

-- segement wise sales
select Postal_Code,sum(Sales) as total_sales from train group by Postal_Code ;

-- group by with order by 
select Segment,sum(Sales) as total_sales from train group by segment order by total_Sales desc ;

--desc -- descending order 

select Segment,sum(Sales) as total_sales from train group by segment order by total_sales asc ;

--- group by , order by +where

-- we want to see the regions having the sales more than 50000

-- to check the data type in ssms 

exec sp_help train;

-- whenver we are use group by with order by we have to use another clause - having clause
--where clause filters the data without grouping 
-- having clause filters the data after grouping it is used when you apply group by

-- regions with sales 50000

select Region, Sales  from train where Sales>500 order by Sales desc;

-- whevner we are applying group by we have to use having cluase for filtering 
-- having clause filtering you have to use one aggregation function 

select Region,SUM(Sales) as total_Sales from train group by Region having sum(Sales) >500 order by total_Sales desc;

-- where

select Region,sum(Sales)  as total_Sales  from train where Sales >500 group by Region  order by total_Sales desc;




