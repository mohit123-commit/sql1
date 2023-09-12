use world;

select * from country;
select count(continent) from country;
select distinct(continent) from country;

select continent from country group by continent;
select continent,count(*) from country group by continent;
select continent,count(*),sum(population) from country group by continent;

select continent,count(*),sum(population) from country group by continent where count(*)>50;  --  error because where can not use in aggregate
select continent,count(*),sum(population) from country group by continent having count(*)>50; 

-- -------------------------------------------------------------
use sakila;
show tables;

desc actor;
desc actor_info;

select first_name from actor limit 3;
select first_name from actor_info order by first_name limit 3;

-- -----------------UNION-------------------------------------------------------------
select first_name from actor
union
select first_name from actor_info order by first_name;

create table xyz(id int);
insert into xyz values(10);
insert into xyz values(30);
insert into xyz values(20);

create table abc(id int);
insert into abc values(10);
insert into abc values(20);
insert into abc values(40);
insert into abc values(50);

select * from xyz                        
union                              -- combination of xyz or abc and distinct value
select * from abc;

select * from xyz
union all
select * from abc;

-- -------------------------------INTERSECT----------------------------------
select * from xyz
intersect                           -- common element
select * from abc;

select * from xyz
except                                   -- jo first me h second me nhi h vo data aayega
select * from abc;

select * from abc
except                                   -- jo first me h second me nhi h vo data aayega
select * from xyz;

create table xyz1(id int,salary int);
select id from xyz1                        
union                              
select * from abc;

select salary from xyz1                        
union                              
select id from abc;

-- ----------------------------JOINS------------------------
-- inner join
-- left join
-- right join
-- full outer

-- primary or foreign key
-- what is join
-- join and set operation
