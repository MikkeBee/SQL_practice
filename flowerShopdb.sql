drop database if exists flowerdb;
create database flowerdb;

use flowerdb;

create table farmer(
    farmerId integer not null primary key,
    farmersName varchar(50) not null,
    farmLocation varchar(30) not null
);

create table growingSite(
    siteId integer not null primary key,
    siteType varchar(20) not null,
    siteDescription varchar(200)
);

create table flower(
    flowerId integer not null primary key,
    flowerName varchar(20) not null,
    unitPrice integer not null,
    farmerRef integer not null,
    siteRef integer not null,
    foreign key (farmerRef) references farmer(farmerId),
    foreign key (siteRef) references growingSite(siteId)
);



drop user if exists 'farmer'@'localhost';
create user 'farmer'@'localhost' identified by 'secret';
grant all privileges on flowerdb.* to 'farmer'@'localhost'; 

insert into farmer values(1,'Roramunda','Vantaa');
insert into farmer values(2,'Roses of Rovaniemi','Rovaniemi');
insert into farmer values(3,'Violets of Hyasinth','Helsinki');

insert into growingSite (siteId, siteType) values(1,'sunny');
insert into growingSite (siteId, siteType) values(2,'shady');
insert into growingSite (siteId, siteType) values(3,'half shadow');
insert into growingSite (siteId, siteType) values(4,'shadow');
insert into growingSite (siteId, siteType) values(5,'dry');

insert into flower values(1,'Violet',80,3,1);
insert into flower values(2,'Rose',100,2,1);
insert into flower values(3,'Tulip',580,1,2);
insert into flower values(4,'Cactus',80,3,5);

select * from farmer;
select * from growingSite;
select * from flower;