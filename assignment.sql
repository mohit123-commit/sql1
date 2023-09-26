use employees;
-- 1)find to get employee no,first name and full name of every person where birth year is greater than the birth year of employee no 10003 
-- and the hire year is less than the hire date of 10005
use employees;
select * from employees;
select emp_no,first_name ,last_name from employees where year(birth_date)>(select year(birth_date) from employees where emp_no=10003) 
And year(hire_date)<(select year(hire_date) from employees where emp_no=10005);

-- 2) get the inforation of those user where is the hire year > among all these hire year of employee no 10003-10007
select * from employees where year(hire_date)>all(select year(hire_date) from employees where emp_no between 10003 and 10007);


-- 3) find out the emp-no ,department no and department name of those user who has worked in my company for more than 28 years
show tables;
select * from departments;
select * from dept_emp;
select dept_emp.emp_no,departments.dept_no,departments.dept_name from departments 
 inner join dept_emp  on dept_emp.dept_no=departments.dept_no
 where departments.dept_no in (select dept_no from dept_emp where  TIMESTAMPDIFF( year,from_date,CURRENT_TIMESTAMP())>28);

select  departments.dept_name ,dept_emp.emp_no, dept_emp.dept_no  from departments 
 inner join dept_emp  on dept_emp.dept_no=departments.dept_no
 where departments.dept_no in (select dept_no from dept_emp where  TIMESTAMPDIFF( year,from_date,CURRENT_TIMESTAMP())>28);
-- 4) find out the emp.no ,department.no and name of emp and next working monday from the date column

-- 5) find out the emp.name,emp.no.depaat.no.depart.name, and the year the total no of month in your company only for users where the total
-- no of months of working is > 33
-- create a foreign key one table to another table

 select *,TIMESTAMPDIFF( year,from_date,CURRENT_TIMESTAMP()) from dept_emp ;
 
-- Que. 4

 select emp_no,dept_emp.dept_no, concat(first_name," ",last_name)as fullName,hire_date,
 ADDDATE(hire_date, INTERVAL 9-DAYOFWEEK(hire_date) day)as NextWorkingDate 
 from employees inner join dept_emp using(emp_no);
 
 -- Que. 5
 
select emp_no,dept_emp.dept_no,departments.dept_name,TIMESTAMPDIFF( month,hire_date,CURRENT_TIMESTAMP()) as months
from employees inner join dept_emp
using (emp_no) inner join departments using(dept_no)
 where TIMESTAMPDIFF( month,hire_date,CURRENT_TIMESTAMP())>400;
 
 -- create a foreign key one table to another table
 
 create table emp(id int primary key ,name char(30));
 insert into emp values(1,"mohit");
 insert into emp values(2,"rohit");
 insert into emp values(3,"ram");
 insert into emp values(4,"vikas");
 
 create table emp_email(id int ,email char(30), foreign key(id) REFERENCES emp(id));
  insert into emp_email values(1,"mohit@gmail");
 insert into emp_email values(2,"rohit@gmail");
 insert into emp_email values(3,"ram@gmail");
 insert into emp_email values(4,"vikas@gmail");
 
 select * from emp inner join emp_email using (id);
 