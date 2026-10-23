-- sub query in sql / nested query 
-- it means that query inside query 
-- it is a query written inside another query it is also called as a inner query or nested query the query which contain here subquery is called the outher query

-- need of a subquery
-- it simplifies your complex queries 
-- improves readbaility 
-- avoids uneccessary joins
-- suport dynamic compariosns 

-- enables nested calcualtions 
create table employees(
emp_id int ,
emp_name varchar(50), 
department varchar(50),
salary int
);
insert into employees (emp_id,emp_name,department,salary) values
(1,'archit','it',10000),
(2,'mudit','it',50000),
(3,'anil','it',50000),
(4,'mohan','jy',70000);

select * from employees;

-- subquery
-- find the employees who earn more than the avergae of all employees

select avg(salary) from employees;
select emp_name,salary from employees where salary>(select avg(salary) from employees);

-- random use of the subquery 

-- subquery is needed when we need to find the result of one sql query to answer the questions of another sql query 
-- advantages 
-- make the cetrain complex queries easier
-- allow comaprisons of the caluated results 
-- help to filter records using another tables

--find the highest paid employee salary

select emp_name,salary from employees where salary=(select max(salary) from employees);
-- employees that are working in the same department where mudit is working 

select emp_name,department from employees where department=(select department from employees where emp_name='mudit');