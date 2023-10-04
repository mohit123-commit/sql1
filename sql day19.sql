-- windows function
-- perform aggregate on groups of rows but produce 

use sakila;
drop table employees;
create table employees(id int primary key auto_increment,
depat varchar(20) ,salary int);

insert into employees(depat,salary) values("hr",200),
("hr",300),('hr',100),
('marketing',70),('marketing',50),('marketing',200),('marketing',400),
('dsa',150),('dsa',120),('dsa',40),('dsa',90),('dsa',500);

select * from employees;
select avg(salary) from employees;

alter table employees rename column depat to dept;
select dept,avg(salary) from employees group by dept;

-- windows : aggregate
-- aggregate for every row

select id,dept,salary from employees;

-- over-----------------------------------
 select id,dept,salary,
avg(salary) over() 
from employees;

 select id,dept,salary,
avg(salary) over() as avgsalary, 
max(salary) over() 
from employees;

-- order by-------------------------
 select id,dept,salary,
avg(salary) over(order by salary) as avgsalary, 
max(salary) over() 
from employees;

-- partition by-------------------------
 select id,dept,salary,
avg(salary) over(partition by dept) as avgsalary
from employees;

 select id,dept,salary,
sum(salary) over(order by salary) as rollingsum
from employees;

 select id,dept,salary,
sum(salary) over(partition by dept) as partitionsum
from employees;

 select id,dept,salary,
avg(salary) over(partition by dept) as avgsalary,
avg(salary) over() as avg
from employees;

 select id,dept,salary,
min(salary) over(partition by dept order by salary desc) as minsalary,
min(salary) over() as min
from employees;

select id,dept,salary,
sum(salary) over(partition by dept order by salary ) as sumsalary,
sum(salary) over(partition by dept) as sum
from employees;

select id,dept,salary,
rank() over()
from employees;

select id,dept,salary,
rank() over(order by salary)
from employees;

insert into employees(dept,salary) values("marketing",200);

select id,dept,salary,
rank() over(order by salary)
from employees;

select id,dept,salary,
rank() over(partition by  dept)
from employees;

select id,dept,salary,
rank() over(partition by  dept order by salary)
from employees;

select id,dept,salary,
rank() over(partition by  dept order by salary),
dense_rank() over(partition by  dept order by salary) as ranking
from employees;

select id,dept,salary,
rank() over(partition by  dept order by salary),
dense_rank() over(partition by  dept order by salary) as ranking
from employees
where ranking=3;