use sakila;

-- dql select statment
select database();
show tables;
show columns from actor;

desc actor;
select * from actor;

select * from sakila.actor;

-- where clause
select * from language where name="english";

select * from language where name>"i";
select * from language where language_id<>3;

select first_name from actor where first_name>'be';

select * from film;
select * from film where title like '%';
select * from film where title like 'a%';
select * from film where title like 'a%r';
select * from film where title like '%dinosaur%';
select * from film where title like '%family%';

select * from film;
select * from film where description like "%drama%";
select title,description,release_year from film where title like 'a%les';
select * from film where title like "a_";
select * from film where title like "a_%";
select * from film where title like "a_e%";

select title,film_id,release_year,description from film;
select title,film_id,release_year,description from film where title like '_c%';
select title,film_id,release_year,description from film where title like 'a%an';
select title,film_id,release_year,description from film where title like '%t___';
select title,film_id,release_year,description from film where title like '_f_i%egg';
select title,film_id,release_year,description from film where title like '__a__%';




