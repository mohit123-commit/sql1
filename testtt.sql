-- Q1 How many movies a user has worked
--     Actor and film_actor table
--     - Number of movies should me more than 3
use sakila;
show tables;

select * from actor;
select * from film_actor;

select first_name,last_name,count(*) from actor inner join film_actor on actor.actor_id=film_actor.actor_id
 group by first_name,last_name having count(*)>3;
-- ------------------------------------------------------------------------------
-- Q2 Get all the information of user with the maximum and minium salary
--     (id , name, email, salary)

use employees;
show tables;

select * from employees;
select * from salaries;

select * from employees inner join salaries using(emp_no) where 
salary=(select max(salary) from salaries) or salary=(select min(salary) from salaries);
-- ----------------------------------------------------------------------------------------
-- Q3 Calculating the total population where the total population should be more
-- than 1000  and there should be more than 2 city in each code

use world;
show tables;
select * from city;
 
select countrycode,count(countrycode),sum(population) from city 
 group by countrycode
having sum(population)>1000 and count(countrycode)>2;
-- ------------------------------------------------------------------------------
-- Q4 Finding all the country code where
-- the number of city in each country should be greater than or equal tol the
-- city present in each country code ” AFG”, ”NLD”, “ARE”  and “BGD”  ( use country table)

select countrycode from city group by countrycode having count(*)>=
any(select count(*) from city where countrycode in('AFG','NLD','ARE','BGD') GROUP BY countrycode);

