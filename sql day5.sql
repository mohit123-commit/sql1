
select length('hi');    -- length of character

select char_length('hi');

-- concat
select concat('h','i') from dual;
select concat('h','-','i') from dual;
select concat('h','i',1) from dual;

-- concat_ws
select concat_ws('-','hey','hello') from dual;
select concat_ws('$','hey','hello','hii') from dual;

-- upper
select upper('hi');

-- substr
select substr('hello',1);   -- index 1 se print krega
select substr('hello',2);        -- index 2 se print krega
select substr('hello',-1);         -- end index print
select substr('hello',-2);        -- end 2 index print

select substr('hello',2,2);     -- index 2 se start 2 value tk print
select substr('hello',2,3);

select substr(substr('hello',1,3), 2);  -- nested substring

-- instr

select instr('hello','ll');   -- ll ki index btayega 
select instr('hello','e');
select instr('hello','ez');

-- locate (substring,data,start index)

select locate('a','rajasthan');  -- index btata h

select locate('a','rajasthan',1);  -- a ki index btayega 1 ke bad
select locate('a','rajasthan',3);   -- a ki index btayega 3 ke bad

-- ltrim -- #remove white space

select ltrim('   xyz');
select rtrim('xyz    ');

select trim('    xyz     ');  -- remove white space from both
select length(trim('    xyz     '));

select trim(leading ' ' from '    xyz    '); -- remove white space from left

select trim(trailing ' ' from '    xyz    ');  -- remove white space from right

select trim(both 'z' from 'zzzzyyyy yz');  -- remove z space from both side

-- lpad
select lpad('hello',6,'#'); -- agr character kam h to add kr dega left side me agr nhi h to kch nhi krega
select lpad('hello1',6,'#');
select lpad('hellolo',6,'#');

-- rpad
select rpad('hell',6,'#');

-- replace  --replace kr deta h
select replace('tushars','s','#');  -- remove all s with #
select replace('tushars','sa','#');
select replace(123,1,'#');

use sakila;
select * from language;

-- count
select count(*) from language;

-- dml
-- insert statment insert into table values(val1,val2,val3)
insert into language values(null,'portuguese',now());
insert into language values(10,'portuguese1',now());
insert into language values(10,'portuguese1',now()); -- duplicate nhi dalta
insert into language values(null,'portuguese',now());

desc language;
select * from language;







