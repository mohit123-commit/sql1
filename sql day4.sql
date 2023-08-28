use sakila;

show tables;
select * from film_list;
select fid,title from film_list where fid <7 and (fid=4 or fid=6);

-- order by clause => sort (ascebding and descending)

select * from film_list order by category;
desc film_list;

-- 4 is the category column
select * from film_list order by 4;
select * from film_list order by 2 ;

select fid,title,category from film_list order by 1;
select fid,title,category from film_list order by price;

select * from address order by district;
select district,address,address_id from address order by district;
select district,address,address_id from address order by district desc,address_id asc;

select district,address,address_id from address order by district,address_id ;

select * from address limit 3;

-- 3 is offset
select * from address limit 3,2;
select * from address limit 5 offset 3;
select * from address  order by address_id desc limit 3;

# table => dual dummy table => logic
select 2+2 from dual;
select now() from dual;
select now();

-- pseduo column => column => specific meaning
-- already available with your system
 
 -- concat,concat_ws,substr













