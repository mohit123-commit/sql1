-- integer
-- float,double,decimal
-- double(total no of value,precision)
-- float =4 byte , double=8 byte,  decimal=4 byte

create table xyz(price double(5,2));
insert into xyz values(15.2);
insert into xyz values(15.243);
insert into xyz values(1513.24);  -- error because 5 count se jyada ho gya
insert into xyz values(151.2432);       
select * from xyz;
				
drop table xyz;
create table xyz(price1 float,price2 double);
insert into xyz values(1.1234567,1.1234567);
select * from xyz;

-- ---------------DATE--------------------------------
drop table xyz;
create table xyz(birthdate date);
-- yyyy-mm-dd

insert into xyz values('2023-09-26');
insert into xyz values(curdate());
select * from xyz;

-- --------------------------TIME----------------------------------------------------
drop table xyz;
create table xyz(birthdate date,birthtime time);
-- yyyy-mm-dd  HH:MM:SS
 
insert into xyz values('2023-09-26','10:56:15');
insert into xyz values(curdate(),curtime());
select * from xyz;

-- ------------------------DateTime--------------------------------------
drop table xyz;
create table xyz(birthdate date,birthtime time, birthdata datetime);
-- yyyy-mm-dd  HH:MM:SS
 
insert into xyz values('2023-09-26','10:56:15','2023-09-28 10:56:22');
insert into xyz values(curdate(),curtime(),now());
select * from xyz;
select birthdata, year(birthdata) from xyz;
select birthdata,year(birthdata),yearweek(birthdata),week(birthdata),quarter(Birthdata) ,last_Day(birthdata) from xyz;
select birthdata, monthname(birthdata) from xyz;
select birthdata, datediff(birthdata,now()) from xyz;
select birthdata, date_add(birthdata,Interval 5 year) from xyz;

-- date
-- year month date weekoftheyear thedayofthedate
select birthdata,concat(year(birthdata),' ',month(birthdata),' ',date(birthdata)," ",week(birthdata),' ',dayname(birthdata))as data from xyz;
select birthdata,date_format(birthdata, '%b %c') from xyz;

-- timeStamp_
create table captions(
text varchar(150),
created_at timestamp default current_timestamp);

insert into captions(text) values ('hey2');
insert into captions(text) values ('hey1');
select * from captions;

create table captions1(
text varchar(150),
created_at timestamp default current_timestamp,
updated_at timestamp on update current_timestamp);

insert into captions1(text,created_at) values ('hey2',now());
update captions1 set text='hey3';
select * from captions1;

-- alter,transaction



















