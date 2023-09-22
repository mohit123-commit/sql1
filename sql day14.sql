create table a(id int);
insert into a values(10);
insert into a values(20);
insert into a values(12);
insert into a values(15);
insert into a values(null);


create table b(id int);
insert into b values(15);
insert into b values(9);
insert into b values(22);

select * from b where id>10;
select * from b where id>(select id from a);     -- erroe
select * from b where id> ANY(select id from a);          -- any operator
select * from b where id< ANY(select id from a);  
select * from b where id= ANY(select id from a);  

-- -------------all-----------------------------------------
select * from b where id> All(select id from a); 
select * from b where id>=All(select id from a);         -- max= a me 20---20 se bda bme
select * from b where id<= All(select id from a where id is not null);       -- small =a me 10-- 10 se kam b me 9

-- ---------------in--------
select * from b where id in (select id from a);          

use employees;
select * from employees;
select * from titles;

select e.emp_no,title from employees as e inner join titles using (emp_no);
select e.emp_no,title from employees as e inner join titles using (emp_no) where title<> 'manager';

select emp_no,first_name,last_name from employees join titles using (emp_no) where title ='manager' AND emp_no
=any(select emp_no from employees join titles using (emp_no) where title<> 'manager');

select count(*) from employees  inner join titles using (emp_no) where title<> 'manager';

select employees.emp_no,first_name,last_name from employees ,titles 
where employees.emp_no=titles.emp_no and first_name='georgi'and title='staff' and last_name='klassen';

-- row subquery-------------------
select mgr.emp_no,mgr.from_date,mgr.title as fd
from titles as mgr ,titles as other
where mgr.emp_no=other.emp_no and mgr.title='manager';

select mgr.emp_no,mgr.from_date,mgr.title, other.title as fd
from titles as mgr ,titles as other
where mgr.emp_no=other.emp_no and mgr.title='manager'
and mgr.title<>other.title;

select mgr.emp_no,year(mgr.from_date),year(other.from_date),mgr.title,other.title as fd
from titles as mgr ,titles as other
where mgr.emp_no=other.emp_no and mgr.title='manager'
and mgr.title<>other.title
and year(mgr.from_date)=year(other.from_date) ;

-- alternative (row subquery)
select emp_no,year(from_date) as fd from titles where title='manager' and
(emp_no,year(from_date)) IN 
(select emp_no,year(from_date) from titles where title <> 'manager');

-- find out the salary and the total count of salary person for those data where the total number of salary person is greater
-- than the salary person of the salary greater than or equal 60117

select * from salaries;

select salary ,count(salary) from salaries group by salary having count(salary)>=
(select count(salary) from salaries where salary=60117 group by salary) ;

-- using the nested query find out the second highest count of salary 
-- sala

