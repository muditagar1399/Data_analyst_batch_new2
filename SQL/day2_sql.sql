use Phone1
-- use command is going to create the tables in my this database 
-- table creation 
create table brand(
brand_id int primary key,
brand_name varchar(40),
brand_cost int,
brand_revenue int,
brand_rating int);

select * from brand;

-- inserting data 

insert into brand values(101,'Apple',100000,10000000,4)
insert into brand values (102,'samsung',50000,5000000,4);

-- second way to insert data 

insert into brand  (brand_id,brand_name,brand_cost,brand_revenue,brand_rating) values 
(103,'Mi',60000,6000000,5),
(104,'Xeomi',50000,588888,4);
-- select - retrive the data --- dql (data query lanuague)
-- insert -- DMl 
-- alter command -- to alter the dataset table (column name change , table renmae , column )
-- Alter command is also the DML command 

alter table brand add brand_success varchar(10);
select * from brand ;
-- whenver we insert data into the table by adding a new column we always point the reference to primary key and we use where clause and update command 
update brand set brand_success='yes' where brand_id=101;
update brand set brand_success='yes' where brand_id=102;
update brand set brand_success='no' where brand_id=103;
update brand set brand_success='yes' where brand_id=104;
-- in sql you cant use the A - a , it is a case sensitive langauage 
-- once you create a table or insert data if it has a primary key you cant run it again 
--update command is used for updating the table data so in this case if we running again not a issue

-- renaming table name 
exec sp_rename 'brand' ,'brands';

select * from brands;

-- changing a data type

alter table brands alter column brand_success varchar(40);

-- delete a row 

-- where clause
-- where clause is used for filtering data

delete from brands where brand_id=104;

select * from brands;

-- aggregate functions 
--sum
--avergae
--count- count the number of rows in the table 
--count(*)-- all values 
-- min
--max

-- always we apply the aggregate functions on the numerical data 
--sum
select sum(brand_cost) as total_cost from brands;
--avergae
select avg(brand_cost) as avergae_Cost from brands;
--min
select min(brand_cost) as min_cost from brands;
--max
select max(brand_cost) as max_cost from brands;
-- count
select count(brand_cost) as count_cost from brands;
-- count
select count(*) as total_rows from brands;

-- output in same in both the cases in count and count(*) but the count (*) is applied on all the columns 
-- whereas count it is applied on column 

-- opertors 
-- operators are the commands or type of operation we are doing on any operand 
-- a , b -- opernads 
--+ -- operator

-- arthemetic operator 
-- +,-,/,*

select * from brands ;

-- calculate profit(-)
select brand_name,
brand_revenue-brand_cost as profit 
from brands;
--+
select brand_name,
brand_revenue+brand_cost as profit 
from brands;
--*
select brand_name,
brand_revenue*1.10 as increased_revenue
from brands;

--/

select brand_name,
brand_revenue/brand_cost as profit 
from brands;

-- comapriosn opertors 
-->,<,<=,>=
select * from brands where brand_revenue>500;
select * from brands where brand_revenue<500;
select * from brands where brand_revenue>=500;
select * from brands where brand_revenue<=500;
--=
select * from brands where brand_success='yes';
-- not equl to 
--<> it is used when we want to check that the condiiton is not we are trying to find 
select * from brands where brand_success<>'yes';

-- logical opertors 
-- and , or , not
-- and 
-- it is true when the both conditions are true 
-- brand rating and brand revenue 
select * from brands where brand_revenue >500000 and brand_rating<>4;
-- or 
-- true output 1 condition is true 
select * from brands where brand_success='yes' or brand_rating=5;



