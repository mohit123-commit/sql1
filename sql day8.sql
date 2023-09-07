-- varchar or char
-- varchar

use test;
create table ep1(name char(20));
insert into ep1 values('hey');
insert into ep1 values('a');
select * from ep1;
select name,length(name) from ep1;

create table ep2(name char(3));
insert into ep2 values('a ');
insert into ep2 values('a    ');     -- char remove space
select * from ep2;
select name,length(name) from ep2;

create table ep3(name varchar(3));
insert into ep3 values('a');
insert into ep3 values('a ');           -- varchar count space
insert into ep3 values('b   ');         -- length se jyada space ho to remove kr dega
insert into ep3 values('baaaa');         -- error
select * from ep3;
select name,length(name) from ep3;

-- check constraints
create table ep4(eid int check(eid>2));
insert into ep4 values(3);
insert into ep4 values(1);       -- error

create table ep5(gender char check(gender in ('m','f','o')));
insert into ep5 values('m');
insert into ep5 values('g');
select * from ep5;


create table ep6(age int, gender char(1) ,check(age>10 and gender in ('m','f','o')));
insert into ep6 values(2,'m');
insert into ep6 values(11,'m');
insert into ep6 values(null,'m');
select * from ep6;

create table ep7(age int, gender char(1) ,check(age>10 or gender in ('m','f','o')));
insert into ep7 values(2,'m');
insert into ep7 values(11,'m');
insert into ep7 values(3,'m');
insert into ep7 values(4,'m');
insert into ep7 values(null,'m');
select * from ep7;

-- delete dml     only data delete   -- isko rollback kr skte h
delete from ep7;
select * from ep7;

delete from ep7 where age=3;
select * from ep7;

-- update dml

update ep7 set age=10 ;
update ep7 set age=10 where age=4;
select * from ep7;

update ep7 set age=13 limit 1;

-- sort(order by) delete
delete from ep7 order by age limit 3;
select * from ep7;

-- drop        -- data or data structure delete  -- isko rollback kr skte h
drop table ep7;

-- truncate      -- table remove kr deta h phr structure create kr deta h  -- isko rollback nhi kr skte

create table ep7(age int, gender char(1) ,check(age>10 or gender in ('m','f','o')));
insert into ep7 values(2,'m');
insert into ep7 values(11,'m');
truncate table ep7;
select * from ep7;

-- group by 
-- distinct
-- difference between distinct and group by
-- how to filter data
































