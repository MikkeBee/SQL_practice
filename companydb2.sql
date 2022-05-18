drop database if exists companydb2;
create database companydb2;

use companydb2;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(20) not null,
    departmentFloor varchar(15) not null,
    headOfDept integer
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30),
    salary decimal(6,2) not null,
    departmentNumber integer not null,
    foreign key (departmentNumber) references department(departmentId)
);

grant all privileges on companydb2.* to 'administrator'@'localhost';

insert into department values(1,'ict','basement',3);
insert into department values(2, 'admin', 'top floor',3);
insert into department values(3, 'secr', 'secret location',4);
insert into department values(4, 'maintenance', 'workshop',4);
insert into department values(5, 'transportation', 'garage',3); 

insert into employee values(1,'Mary','River',3000,1);
insert into employee values(2,'Matt','River',4000,1);
insert into employee values(3,'Amanda','Smith',7000,2);
insert into employee values(4,'Joe','Doe',9000,3);
insert into employee values(5,'Vera','Jones',6500,2);
insert into employee values(6,'Peter','Bond',3000,5);
insert into employee values(7,'Layla','Driver',5000,5);

alter table department add foreign key(headOfDept) references employee(employeeId);