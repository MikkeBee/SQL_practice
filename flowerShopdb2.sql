drop database if exists flowerdb2;
create database flowerdb2;

use flowerdb2;

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
    siteRef integer not null,
    foreign key (siteRef) references growingSite(siteId)
);

create table farmer_grows_flower(
farmerRef integer not null,
flowerRef integer not null,
Primary key(farmerRef, flowerRef),
foreign key(farmerRef) references farmer(farmerId),
foreign key(flowerRef) references flower(flowerId)
);

create table customer(
    customerId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    customerAddress varchar(50) not null
);

create table customerOrder(
    orderNumber integer not null primary key,
    customerRef integer not null,
    orderDate date not null,
    foreign key(customerRef) references customer(customerId)
);

create table order_has_flower(
    orderRef integer not null,
    flowerRef integer not null,
    amount integer not null,
    primary key(orderRef, flowerRef),
    foreign key(orderRef) references customerOrder(orderNumber),
    foreign key(flowerRef) references flower(flowerId)
)

drop user if exists 'farmer'@'localhost';
create user 'farmer'@'localhost' identified by 'secret';
grant all privileges on flowerdb2.* to 'farmer'@'localhost'; 

insert into farmer values(1,'Roramunda','Vantaa');
insert into farmer values(2,'Roses of Rovaniemi','Rovaniemi');
insert into farmer values(3,'Violets of Hyasinth','Helsinki');

insert into growingSite (siteId, siteType) values(1,'sunny');
insert into growingSite (siteId, siteType) values(2,'shady');
insert into growingSite (siteId, siteType) values(3,'half shadow');
insert into growingSite (siteId, siteType) values(4,'shadow');
insert into growingSite (siteId, siteType) values(5,'dry');

insert into flower values(1,'Violet',80,1);
insert into flower values(2,'Rose',100,1);
insert into flower values(3,'Tulip',580,2);
insert into flower values(4,'Cactus',80,5);

insert into farmer_grows_flower values(1,1);
insert into farmer_grows_flower values(1,2);
insert into farmer_grows_flower values(2,2);
insert into farmer_grows_flower values(3,1);

insert into customer values(1,'Matt','River','Seapath 2');
insert into customer values(2,'Mary','Jones','Dataway 20');

insert into customerOrder values(1,1,'2022-05-13');
insert into customerOrder values(2,1,'2022-05-01');
insert into customerOrder values(3,2,'2022-05-21');

insert into order_has_flower values(1,2,10);
insert into order_has_flower values(2,2,5);
insert into order_has_flower values(3,1,10);
insert into order_has_flower values(3,2,10);

select * from farmer;
select * from growingSite;
select * from flower;
select * from farmer_grows_flower;


-- which farmers are farming roses?
select farmersName from farmer
inner join farmer_grows_flower on farmerRef=farmerId
inner join flower on flowerRef=flowerId
where flowerName='Rose'
order by farmersName asc;

-- flowers that need a sunny site
select flowerName from flower
inner join growingSite on siteRef=siteId
where siteType='sunny'
order by flowerName asc;

-- what flowers has Mary ordered? FlowerNames, unitprice and amount
select flowerName, unitPrice, amount from flower
inner join customerOrder on flowerRef=flowerId
inner join customer on customerRef=customerId
where firstname='Mary';

select flowerName, unitPrice, amount, unitPrice*amount as total from flower
inner join customerOrder on flowerRef=flowerId
inner join customer on customerRef=customerId
where firstname='Mary';