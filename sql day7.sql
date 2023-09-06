
-- create database test
-- structure - table  row and columns
-- row and columns data type

use test;
create table student(sid int,email char(20));
select * from student;

-- dml insert
insert into student values(2,null);

create table student1(sid int,email char(20) default 'hey');         -- use of default 
insert into student1(sid) values(2);
insert into student1(sid,email) values(3,null);
select * from student1;

-- constraints =. condition => invalid data can not be inserted
-- not null         #can not insert null
create table student2(sid int not null default 0,email char(20) default 'gmail,com');
insert into student2(email) values('user');
insert into student2(sid,email) values(null,'user');  -- error aayega because null dala h
select * from student2;

-- unique constraints
create table student3(sid int unique default 0,email char(20) default 'gmail,com');
insert into student3(sid,email) values(1,'user');
insert into student3(sid,email) values(2,'user');
insert into student3(sid,email) values(2,'user');      -- error bcoz id unique honi chaiye
insert into student3(sid,email) values(null,'user');      -- null = no reference  --null ko unique constraints me kitni bar likh skte h
insert into student3(sid,email) values(null,'user');
insert into student3(email) values('user');
insert into student3(email) values('user');     -- error bcoz default 0 set ho chuka h jo unique h
select * from student3;
select sid,sid+5 from student3;

drop table employee;

-- primary key
create table employee(eid int primary key,ename char(20));
insert into employee values(1,'tushar');
insert into employee values(2,'tushar');
insert into employee values(2,'tushar');      -- error bcoz 2 is not unique ,,,use kr chuke h 2
insert into employee values(null,'tushar');  -- error bcoz primary key me null nhi hota
select * from employee;

create table employee1(eid int ,ename char(20) , primary key(eid));  -- second use of primary key

-- data type
-- int => numerical number
-- int[(width)] [unsigned] [zerofill]
--   -2,147,483,648 to -2,147,483,647          (4 byte storage)
-- unsigned=> no negative number     signed=> positive or negative number

drop table employee2;
create table employee2(eid int(1));

insert into employee2 values(2);
insert into employee2 values(22);
select * from employee2;

drop table employee3;
create table employee3(eid int(2) zerofill);
insert into employee3 values(2);
insert into employee3 values(233);
insert into employee3 values(-42);          -- error bcoz negative number nhi hoga bcoz width 2 h 
select * from employee3;

drop table employee4;
create table employee4(eid int unsigned);
insert into employee4 values(42); 
insert into employee4 values(-42);    -- error bcoz negative number nhi hoga bcoz unsigned
select * from employee4;

-- bigint size 8 byte 
create table employee5(eid bigint unsigned);
insert into employee5 values(18446416451684615-1); 
insert into employee5 values(184464164516846516*100); 

select * from employee5;

-- tinyint 1 byte, smallint  2 byte,mediumint 3 byte
-- 0 to 256 unsigned     ,-127 to 128 signed
-- 1  byte = 8 bit

-- boolean => true and false =>tinyint
create table employee6(i bool);
insert into employee6 values(true),(false);
insert into employee6 values (1),(0),(-128),(127);
select * from employee6;

-- acid property in rdbms
-- how acid property are implement in rdbms
-- constraints
-- foreign key






