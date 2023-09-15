use sakila;
desc film;
desc inventory;

select film.film_id,title from film;
select film_id,last_update from inventory;

select title,inventory.film_id,inventory.last_update from 
film inner join inventory using (film_id);

select * from film;
select * from inventory;
select * from rental;

select title,rental_id from 
film inner join inventory using (film_id)
inner join rental using (inventory_id);

select title,count(rental_id) as totalcount  from 
film inner join inventory using (film_id)
inner join rental using (inventory_id) 
group by title having totalcount>15
order by totalcount desc limit 5;

select * from customer;
select * from rental;
select * from inventory;
select * from film_category;
select * from category;

select  cust.email,  category.name,count(film_category.category_id) as moviecount
 from customer as cust 
inner join rental using(customer_id)
inner join inventory as inv using (inventory_id)
inner join film_category using(film_id)
inner join category using (category_id)
group by email,name having moviecount>2;


-- SELF JOIN
create table employee(eid int,ename varchar(20),email varchar(20),manager_id int);
insert into employee values(1,'tushar','tushar@gmail.com',null);
insert into employee values(2,'gopal','gopal@gmail.com',1);
insert into employee values(3,'aman','aman@gmail.com',4);
insert into employee values(4,'yashika','yashika@gmail.com',2);
select * from employee;

-- ----------self join----------------------------------------------------------
select emp.eid, emp.ename, emp.manager_id,
manager.eid,manager.ename
 from employee as emp,employee as manager
 where emp.manager_id=manager.eid;

select * from film;
-- ------------nested query
select film_id,rental_duration from film where film_id=1;

select film_id,rental_duration from film where rental_duration=6;

-- -------------------nested query---------------------------------------------------------------
-- single result subquery or single result nested query=> inner query solve krke outer query solve krta h
select film_id,rental_duration from film where rental_duration=(select rental_duration from film where film_id=1);



