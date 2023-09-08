-- alias name -nickname
-- expression => accha name(readability)

-- alias function(as)
use sakila;
select first_name from actor;
select first_name, concat('MR ' ,first_name) as fullName from actor;
select first_name, concat('MR ' ,first_name)  fullName from actor;
select first_name, concat('MR ' ,first_name) as fullName from actor where fullName='MR NICK';  -- error dega
select first_name, concat('MR ' ,first_name)  fullName from actor order by fullname;

-- ------------------------------------------group by------------------------------------------------
select first_name,length(first_name) from actor;

-- multiple row => output
-- similar value collect => perform operation
-- group => group operation

-- -------------------group by operation------------------------
use world;
show tables;
select * from country;

desc country;
create table t1(id int ,city varchar(20));
insert into t1 values(1,'hey');
insert into t1 values(2,'hey2');
insert into t1 values(null,'hey');
 
 select * from t1;
 -- ------------------------count----------
  select count(*) from t1;            -- null count nhi krta not null vala lia h not null vala city h
  select count(id) from t1;       -- null count nhi krta

-- -----------------------sum-----------------------
select sum(id) from t1;

-- ------------------------distinct-------------------------
select distinct(city) from t1;
select distinct(city),id from t1;

select count(distinct city) from t1;
select count(distinct id) from t1;

select * from city;
select count(name) from city where countrycode='afg';
select * from city where countrycode='afg';

select countrycode from city group by countrycode;

select distinct countrycode from city ;

desc city;
select countrycode,count(id) from city group by countrycode;
select countrycode,count(id),sum(population) as totalPopulation from city group by countrycode;
select countrycode,count(id),sum(population) as totalPopulation from city group by countrycode order by totalPopulation;
 
 -- ------------------Question-----------------------
-- total population with name() with the count 
-- country afg has total count of () and sum is (populaion.sum)

select countrycode,concat('country ' ,(select countrycode ), ' has total population ' ,(select sum(population) )) as result from city group by countrycode;



-- where function group function par kam nhi krta

-- having     #group by pr apply hota h
select countrycode,count(id),sum(population) as totalPopulation
 from city 
 group by countrycode 
 having sum(population)>500 
 order by totalPopulation;

select countrycode,count(id),sum(population) as totalPopulation
 from city 
 group by countrycode 
 having sum(population)>500  and count(id)>1
 order by totalPopulation;

select countrycode,sum(population) from city
where population>200000
group by countrycode;

select countrycode,sum(population) from city
group by countrycode;

select * from country;
select continent,count(*) from country group by continent;

select continent,region from country 
where continent='europe'
group by continent,region;

select continent from country 
where continent='europe'
group by continent;

desc country;
select continent,region,count(*) from country 
where continent='europe'
group by continent,region;

select continent,region,count(code) from country 
where continent='europe'
group by continent,region;

select continent,region,count(code) from country 
where continent='europe'
group by continent,region order by region,continent;