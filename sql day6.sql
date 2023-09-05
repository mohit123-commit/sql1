use sakila;
desc language;

-- insert into table values()

select * from language;
insert into language values(12,'portuguese',now());
insert into language values(13,'russian','2020-09-26 10:35:00');

-- insert ignore   # warning dega
insert ignore into language values(13,'russian','2020-09-26 10:35:00');
insert ignore into language values(14,'china','2020-09-26 10:35:00');

insert ignore language values(14,'china','2020-09-26 10:35:00',20);

insert into language (language_id,name,last_update) values(15,'india','2020-09-26 10:35:00');
insert into language (last_update,language_id,name) values('2020-09-26 10:35:00',16,'arabic');

insert into language (last_update,name) values('2020-09-26 10:35:00','bangal');

-- multiple value insert
insert into language (last_update,name) values('2020-09-26 10:35:00','bangal1')
,('2020-09-26 10:35:00','bangal2')
,('2020-09-26 10:35:00','bangal3');

insert into language (name) values('bangal4');

-- set
insert into language set language_id=100,name='abc';

-- create database => sql => folder
create database test;
create database if not exists test;

use test;
show tables;

-- ddl statment  #create => table,index,view,

create table employee(eid int , ename char(20) , email char(20));
desc employee;

insert into employee values (1 ,"tushar","tushar@gmail.com");
insert into employee values (2 ,"tushar",null);

select * from employee;

create table employee2(eid int default 0 , ename char(20) , email char(20));
insert into employee2(ename,email) values("abc","abc@gmail,com");
insert into employee2(ename,email) values("cde","abc@gmail,com");
insert into employee2(eid,ename,email) values(null,"cde","abc@gmail,com");
select * from employee2;

create table employee3(id int, email  char(20));
insert into employee3 values (1,"mohit@gmail");
select * from employee3;
update employee3 set id=2,email='rohit@gmail.com' where id=19


-- delete table employee3;




















