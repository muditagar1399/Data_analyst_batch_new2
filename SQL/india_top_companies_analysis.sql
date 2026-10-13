use [comapnies ]
select * from [India Top companies];
-- data types 
-- order by - sorting  desc (descending ) be default it is ascending 
-- groupby to group the column based on any numerical column - one column has to be numerical 
-- where- to filter the data 
-- having - after groupig to filter the data 
-- groupby
-- qtr_sales based on comanies names order it in ascending order
select Company_name, sum(Qtr_Sales_Var) as total_sales from [India Top companies] group by Company_name order by total_sales desc;
-- where
select * from [India Top companies] where ROCE>20;
-- where and order by 
select Company_name , Sles_Qtr_Rs_Cr from [India Top companies] where Sles_Qtr_Rs_Cr>1000 order by Sles_Qtr_Rs_Cr desc;
-- group by and having 
select Company_name , sum(Sles_Qtr_Rs_Cr) as total_Sales from [India Top companies] group by Company_name having sum(Sles_Qtr_Rs_Cr) >1000 order by total_Sales desc;