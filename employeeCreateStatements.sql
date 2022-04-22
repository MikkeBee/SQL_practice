drop database if exists employeedb;
create database employeedb;
use employeedb;

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    department varchar(15),
    salary decimal(6,2)
);

insert into employee values (1,'Matt','River','ICT',5000);
insert into employee values (2,'Mary','Smith','Admin',7000);
insert into employee (employeeId,firstname,lastname)
values(3,'Vera','River');
insert into employee values (4,'Will','Guard',null,null);

insert into employee (employeeId,firstname,lastname,department,salary)
values(5,'Jesse','Smith','finance',7000);

insert into employee (firstname,lastname,salary,employeeId)
values('John','Doe',4000,6);

insert into employeedb.employee values(7,'Peter','Purse','finance',8000);

drop user if exists 'maria'@'localhost';
create user 'maria'@'localhost' identified by '1234';
grant all privileges on employeedb.* to 'maria'@'localhost'; 


