drop database if exists turtledb;
create database turtledb;

use turtledb;

create table turtle(
    number integer not null primary key,
    name varchar(20) not null,
    speed varchar(26) not null,
    age integer not null,
    weightKg integer not null
);


--test insertions
insert into turtle values(1,'Leonardo','fast', 18, 87);
insert into turtle values(2,'Michelangelo','super fast', 17, 79);
--test insertions

drop user if exists 'liam'@'localhost';
create user 'liam'@'localhost' identified by 'WEMf5kus';

grant all privileges on turtledb.* to 'liam'@'localhost';
