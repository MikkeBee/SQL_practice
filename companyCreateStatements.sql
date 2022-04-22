drop database if exists companydb;
create database companydb;

use companydb;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(20) not null,
    departmentFloor varchar(15) not null
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30),
    salary decimal(6,2) not null,
    departmentNumber integer not null,
    foreign key (departmentNumber) references department(departmentId)
);

insert into department values(1,'ict','basement');
insert into department values(2,'admin','top floor');
insert into department values(3,'secr','secret location');
insert into department values(4,'maintenance','workshop');
insert into department values(5,'transportation','garage');

insert into employee values(1,'Mary','River',3000,1);
insert into employee values(2,'Matt','River',4000,1);
insert into employee values(3,'Amanda','Smith',7000,2);
insert into employee values(4,'Joe','Doe',9000,3);
insert into employee values(5,'Vera','Jones',6500,2);
insert into employee values(6,'Peter','Bond',3000,5);
insert into employee values(7,'Layla','Driver',5000,5);

drop user if exists 'adminstrator'@'localhost';
create user 'adminstrator'@'localhost' identified by '1234';

grant all privileges on companydb.* to 'adminstrator'@'localhost';

