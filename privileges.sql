create user 'sammy' identified by 'password';
select * from mysql.user;

drop user 'sammy';
select * from mysql.user;

create user bob identified by 'bob';

-- changing the password
alter user 'bob' identified by 'newPassword';

-- setting password
set password ='new Password';

-- for other use
set password for ' bob'@'localhost' = 'new password';

-- locking user
alter user 'bob' account lock;

-- Expire user password
-- so if user wants to runs a query then user have to change his password
alter user ' bob'@'localhost' password Expire;

-- rename user;
rename user 'bob' to 'robert';
select * from Mysql.user;
drop user bob;
--  --------
-- privileges
-- 4 types
-- global privileges
-- database privileges
-- object privileges
-- column privileges

show privileges;











