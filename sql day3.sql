use sakila;

select actors,title from film_list where actors like 'nat_%';

-- logical and or not

select * from actor;
select * from actor where first_name='nick' and actor_id=2;
select * from actor where first_name='nick' or actor_id=3;

show tables;
select * from actor_info;
select * from actor_info where film_info like 'animation%';
select * from actor_info where film_info like 'animation%' and first_name='goldie';
select * from actor_info where  first_name='goldie';

select * from actor_info;
select * from actor_info where film_info like 'animation%' and first_name='goldie' or first_name='nick';
select * from actor_info where film_info like 'animation%' or first_name='goldie' and first_name='nick';

select * from film_list;
select category,rating,title from film_list where category like 'sci-fi' and rating like 'pg';
select category,rating,title from film_list where (category like 'sci-fi' or category like 'family')  and rating like 'pg';

select 2+2*3;
select (2+2)*3;

-- between
select * from actor where actor_id between 2 and 5;
select * from actor where actor_id between 5 and 2;

select * from actor where actor_id>=2 and actor_id<=5;

select * from actor where first_name between 'b' and 'dan';

select * from actor where first_name >'d';

-- use of in 
select * from actor where actor_id in (2,5);
select * from actor where actor_id=2 or actor_id=5;

-- not operator <> !=

select * from actor where actor_id!=2 ;
select * from actor where not(actor_id=2);

-- 1 actor_id 2 to 7 and first_name =nick or ed
select * from actor where actor_id between 2 and 7 and (first_name='nick' or first_name='ed');

-- 2 last_name me 'a' or 'e sath nahi aaye
select * from actor where  not(last_name like '%a%e%');

-- 3 first_name me grace or mattew or joe na ho and actor id <15;
select * from actor where not(first_name='grace' Or first_name='matthew' or first_name='joe') and actor_id<15;

-- 4 last name me 'a' nhi aaye and first name me 'i' nhi aaye or actor_id 10-20 ke bich ho
select * from actor where not(last_name like '%a%') and not(first_name like '%i%') and actor_id between 10 and 20;









