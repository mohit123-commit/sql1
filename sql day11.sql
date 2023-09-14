use sakila;
show tables;
desc actor;
desc actor_info;

select * from film_actor;
select * from actor;

-- inner join
-- method 1---using
select actor.actor_id,first_name,film_id
from actor inner join film_actor using(actor_id);

create table student(id int,name varchar(20));
insert into student values (1,'tushar');
insert into student values (2,'tushar2');
insert into student values (5,'aman');
select * from student;

create table student_hobby(id int,hobby varchar(20));
insert into student_hobby values (1,'cricket');
insert into student_hobby values (2,'badminton');
insert into student_hobby values (3,'tennis');
select * from student_hobby;

select count(*) from student;
select count(*) from student inner join student_hobby;

-- method 1 of using
select student.id,name,hobby from student inner join student_hobby using(id);

-- method 2 with where clause
select student.id,name,hobby from student , student_hobby where student.id=student_hobby.id;

-- method 3 -- on clause
select student.id,name,hobby 
	from student inner join student_hobby  
		on(student.id=student_hobby.id);
    
-- left join    
select student.id,name,hobby 
	from student left join student_hobby  
		on(student.id=student_hobby.id);
 
 -- right join or right outer join
 select student.id,name,hobby 
	from student right join student_hobby  
		on(student.id=student_hobby.id);
        
select student.id,name,hobby 
	from student right outer join student_hobby  
		on(student.id=student_hobby.id);
        
-- full join -- not support in sql
select student_hobby.id,name,hobby from student full join student_hobby;        

select * from film;
select actor.actor_id,first_name,last_name,film_id,title,release_year
             from
actor inner join film_actor using(actor_id)
inner join film using (film_id);

select id,name,hobby from student natural join student_hobby;

-- inner ,outer,left ,right,cross,self join
        