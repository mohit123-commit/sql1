use employees;
show tables;
select * from employees;

-- e,{10003  =>hiring date

select hire_date from employees where emp_no=10003;
select * from employees where hire_date>'1986-08-28';

-- -----------------subquery or nested query--------------------------------------------------------------
select * from employees where hire_date> ( select hire_date from employees where emp_no=10003);

select * from employees where first_name='georgi' and last_name='facello';
select * from employees where first_name='georgi' and birth_date='1953-09-02';

select * from titles;
-- title == emp_no=10001

select title from titles where emp_no=10001;
select * from titles where title=(select title from titles where emp_no=10001);

select title from titles where emp_no in (10001,10002);
select * from titles where title=(select title from titles where emp_no in (10001,10002));   -- error bcoz we have two result

-- subquery return 1 row => then we use =>,=,<,>,>=,<=
-- subquery return more than 1 row => then we use operator

-- --------------------------ANY operator---------------------
select * from titles where title= ANY(select title from titles where emp_no in (10001,10002));

select salary from salaries where emp_no=10002;

select * from salaries where salary = ANY(select salary from salaries where emp_no=10002);
select * from salaries where salary > ANY(select salary from salaries where emp_no=10002);
select * from salaries where salary < ANY(select salary from salaries where emp_no=10002) order by salary desc;
select * from salaries where salary <= ANY(select salary from salaries where emp_no=10002) order by salary desc;

--    =any:-(equivalent to all the result set value)
--     >any:- greater than the minimum value of result set
--     <any:- less than the maximum value of result set







