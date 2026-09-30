create database mobile1;
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