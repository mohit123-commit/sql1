use sakila;
select * from test;

-- view
-- stored query (query(store)==table ki form me)
-- data ( name -> view)
-- access(0 virtual table

-- 2 type ke hota
-- simple,complex

-- simple view ; jisme koi clused,function aggregation

create table employee123(id int,name varchar(20),salary int);
insert into employee123 values(10,'abc',100),(20,'def',200),(30,'new',300);
select * from employee123;

create view empview as select id,name from employee123;
select * from empview;

insert into empview values(40,'japan');
select * from empview;
select * from employee123;

alter view empview as 
select id,name from employee123 where id=30;
select * from empview;

insert into empview values(50,'iraq');
select * from empview;

drop table dept123;
create table dept123(id int,deptname varchar(20));
insert into dept123 values(10,'HR'),(20,'Marketing'),(100,'oops');
select * from dept123;

create view empjoinn as
select employee123.id,name,deptname
from employee123 inner join dept123 using (id);

insert into empjoinn(id,name) values(60,'kilo');
insert into empjoinn(deptname) values('yak');
select * from empjoinn;

select * from dept123;
select * from employee123;

-- group by rollup
-- normalisation






