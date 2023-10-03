-- views--------------------------------------------

use sakila;
show tables;
drop table abc;
select * from actor;

select actor_id,first_name from actor;

-- virtual view--------------------------------------------------------
create view actor_view as 
select actor_id,first_name from actor;

select * from actor_view;

create table test(id int ,name varchar(20));
insert into test values(1,'tushar');
insert into test values(2,'aman');
insert into test values(3,'aditya');

create view testview as
select name from test;

select * from testview ;

-- insert 
insert into testview values("regex");
select * from testview;
select * from test;

insert into test values(100,"navi");
select * from testview;
select * from test;

-- delete view
delete from testview where name='navi';
select * from testview;
select * from test;

-- replace------------------------
create or replace view testview as
select id,name from test;
select * from testview;

-- alter
alter view testview as select name from test where id>2;
select * from testview;

drop view testview;
show tables;

select * from country;
select * from city;

select country_id,country,city_id,city
 from country inner join city using(country_id);

create view city_view as
select country_id,country,city_id,city
 from country inner join city using(country_id);
 
 select * from city_view;
 insert into city_view values(9999,'yyy',999,'japan');    -- insert nhi kr skte kyuki join ho rkha h --subquery,group by pr insert nhi kr skte
 
 select * from test;
 select count(id) from test;
 
 -- ifnull()---------------------------------------
select id,ifnull(id,0) from test;

 select count(id) from test;
select count(ifnull(id,0)) from test;

-- coalesce()--------------------------------return not null value who comes first
alter table test add column salary int;
insert into test values(4,null,100);
insert into test values(null,null,200);
insert into test values(100,null,null);
select * from test;

select id,name,salary ,coalesce(id,name,salary) from test;  -- return not null value who comes first

-- movieid, name, duration, price
-- customerid,cusname,movieId,watchDate

-- 1) sare customerid,custname,moviesid jo kisi  hi customer ne dekhi ho
-- 2) get all the information of customer whether thay have watched movie or not
-- 3)  get the customer id and total number of movies that have been watched by a user after year 2000
-- 4) find out total amount spent by the user to watch movie and average duration he has watched movie
-- 5) get only the customerid,cousname of those  person who have watched max no of movie

CREATE TABLE movies (
  movie_id INT NOT NULL PRIMARY KEY,
  movie_name VARCHAR(255) NOT NULL,
  movie_duration INT NOT NULL,
  release_date DATE NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE customers (
  customer_id INT NOT NULL PRIMARY KEY,
  customer_name VARCHAR(255) NOT NULL,
  watch_date DATE NOT NULL,
  movie_id INT NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies (movie_id)
);

-- Movies table
INSERT INTO movies (movie_id, movie_name, movie_duration, release_date, price)
VALUES  (2, 'The Godfather', 175, '1972-02-28', 12.00),
        (3, 'The Dark Knight', 152, '2008-03-20', 14.00),
        (4, '12 Angry Men', 96, '1957-06-29', 8.00),
        (5, 'The Lord of the Rings', 178, '1957-06-29', 16.00);

-- Customers table
INSERT INTO customerss (customer_id, customer_name, watch_date, movie_id)
VALUES (1, 'John Doe', '2023-10-03', 1),
       (2, 'Jane Doe', '2023-10-04', 2),
       (3, 'Peter Doe', '2023-10-05', 3),
       (4, 'Susan Doe', '2023-10-06', 4),
       (5, 'Michael Doe', '2023-10-07', 5);
       
INSERT INTO customers (customer_id, customer_name, watch_date, movie_id)
VALUES (6, 'Vaibhav', '2023-10-03', 1),
       (7, 'vishal', '2023-10-04', 2),
       (8, 'Arvind', '2023-10-05', 3),
       (9, 'Sushil', '2023-10-06', 4),
       (10, 'Mahima', '2023-10-07', 5);
       
select * from movies;
select * from customers;

-- 1) get all customer id, customer name and movie name jo kisi bhi customer ne dekhi hai

SELECT customers.customer_id, customers.customer_name, movies.movie_name
FROM customers
INNER JOIN movies ON customers.movie_id = movies.movie_id;

-- 2) get all info of customer whether they have watched movie or not

SELECT customers.customer_id, customers.customer_name,
  CASE WHEN EXISTS (SELECT 1 FROM customers
    INNER JOIN movies ON customers.movie_id = movies.movie_id) THEN 'Watched' ELSE 'Not Watched' END AS watched_status
FROM customers;

-- 3) get the customer id and total number of movies that have been watched by a user after year 2000
SELECT customer_id, COUNT(DISTINCT movies.movie_id) AS total_movies_watched
FROM customers
INNER JOIN movies ON customers.movie_id = movies.movie_id
WHERE movies.release_date > 2000
GROUP BY customer_id
ORDER BY total_movies_watched DESC
LIMIT 0, 1000;

-- 4) find total amount spent by user to watch movie and average time duration he has watched movie
SELECT customer_id, SUM(movies.price) AS total_amount_spent, AVG(movies.movie_duration) AS average_watch_duration
FROM customers
INNER JOIN movies ON customers.movie_id = movies.movie_id
GROUP BY customer_id
ORDER BY total_amount_spent DESC;

-- 5) get only the customer id, customer name of those who has watched the max number of movies

SELECT customers.customer_id, customers.customer_name
FROM customers
INNER JOIN (
  SELECT customer_id, COUNT(DISTINCT movies.movie_id) AS total_movies_watched
  FROM customers
  INNER JOIN movies ON customers.movie_id = movies.movie_id
  GROUP BY customer_id
  ORDER BY total_movies_watched DESC
  LIMIT 1
) AS max_movies_watched ON customers.customer_id = max_movies_watched.customer_id
LIMIT 0, 1000;