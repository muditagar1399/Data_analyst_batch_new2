-- to run a database
use employee_data

-- create the table

create table employee(
employee_id int primary key,
employee_name char(20),
employee_salary float(20),
employee_Department char(30),
employee_email char(20),
employee_designation char(30));

-- check the table
select * from employee;

-- insert the data 
insert into employee  (employee_id,employee_name,employee_salary,employee_Department,employee_email,employee_designation) values 
(101,'aman',750000,'IT','aman@gmail.com','Manager'),
(102,'mudit',900000,'IT','mudit@gmail.com','Data analyst'),
(103,'anil',1100000,'Marketing','anil@gmail.com','Manager'),
(104,'zenia',1200000,'HR','zenia@gmail.com','Executive'),
(105,'shivam',3000000,'IT','shivam@gmail.com','Manager');

select * from employee;

---- select - retrive the data --- dql (data query lanuague)
-- insert -- DMl 
-- alter command -- to alter the dataset table (column name change , table renmae , column )
-- Alter command is also the DML command 

alter table employee add employee_appraisal float(30);

select * from employee;

update employee set employee_appraisal= 10 where employee_id=101;
update employee set employee_appraisal= 5.5 where employee_id=102;
update employee set employee_appraisal= 15 where employee_id=103;
update employee set employee_appraisal= 7 where employee_id=104;
update employee set employee_appraisal= 9.5 where employee_id=105;

-- in sql you cant use the A - a , it is a case sensitive langauage 
-- once you create a table or insert data if it has a primary key you cant run it again 
--update command is used for updating the table data so in this case if we running again not a issue

-- renaming table name 
exec sp_rename 'employee' ,'employees';

select * from employees;

-- changing a data type

alter table employees alter column employee_Department varchar(60);

-- delete a row 

delete from employees where employee_id=105;

select * from employees;

-- DROP 

-- it will drop the table 

-- drop table employees;

-- showing on the brand table in mobile
-- in this we are dropping table brands 
use  mobile

drop table brands;

select * from brands;

---- where clause
-- where clause is used for filtering data
-- aggregate functions 
--sum
--avergae
--count- count the number of rows in the table 
--count(*)-- all values 
-- min
--max
-- always we apply the aggregate functions on the numerical data 
select * from employees;
--sum
select sum(employee_salary) as total_salary from employees;
select sum(employee_salary)  from employees;
--avergae
select avg(employee_salary) as avergae_salary from [employees ];
--min
select min(employee_salary) as min_salary from employees;
--max
select max(employee_salary) as max_salary from employees;
-- count
select count(employee_salary) as count_records from [employees ];
-- count
select count(*) as total_rows from [employees ];

-- never ever used the reserve keyword for example dont use the predefined functions or anything which is already there in sql 

-- output in same in both the cases in count and count(*) but the count (*) is applied on all the columns 
-- whereas count it is applied on column 
-- opertors 
-- operators are the commands or type of operation we are doing on any operand 
-- a , b -- opernads 
--+ -- operator
-- arthemetic operator 
-- +,-,/,*
-- we can only apply the opertors on numerical data 
--+
select employee_name,
employee_salary,
employee_salary+50000 as new_Salary 
from employees;
-- nothing is changed in the data of employee table but we just perform the operaiton 
select * from employees;
-- - 
select employee_name,
employee_salary,
employee_salary-50000 as new_Salary 
from employees;

--*
select employee_name,
employee_salary,
employee_salary*10/100 as new_Salary 
from employees;

--/
select employee_name,
employee_salary,
employee_salary/50000 as new_Salary 
from employees;

--comaprison opertors 

--=
--!,<>-- not equals to- when we have to find data that doesnt exist
-->
--<
-->=
--<=
-- > than
select * from [employees ] where employee_salary>500000;
--<
select * from [employees ] where employee_salary<500000;
--=
select * from [employees ] where employee_salary=500000;
-->=
select * from [employees ] where employee_salary<=500000;
--->=
select * from [employees ] where employee_salary>=500000;
--<>,!=
select * from [employees ] where employee_salary!=1100000;

--logical opertors

-- which works on condition 
-- when we are filtering the data logical opertors work on condition 
-- and 
-- when the both are true or meet it will show the output 
--or 
-- when the one conditon is true it will show the output 
-- not 
-- it wont show the output from the range 

-- and 
--find employees whose salary is greater than 11000000 and the department is it
select * from [employees ] where employee_salary=1100000 and employee_Department='IT';

--or 
select * from [employees ] where employee_salary=1100000 or employee_Department='IT';
--not
select * from [employees ] where employee_salary<>1100000 and employee_Department='IT';


-- between 
-- between operators have dont any categroy
select * from employees where employee_salary between 800000 and 1100000;

-- in which is again a seperate opertor 
-- we use in opertoar to combine the fields 
select * from employees where employee_Department in('IT','Marketing');

select * from [employees ];

-- like -- seperate opertor (pattern matching )
select * from employees where employee_name like '%an%';


-- is null 
-- if you find the balnaks in data cleaning we use this 
select * from employees where employee_salary is null;

-- order by 
-- order by is used for sorting the data 
-- order by clause is always used on numerical data and it is used with some caluclation 
-- find the employyes based on the salary 
-- desc - meands descending order and asc meand ascending order 
select * from employees order by employee_salary desc;
select * from employees order by employee_salary asc;
