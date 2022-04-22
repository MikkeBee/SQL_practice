use turtledb;

--clear test insertions
delete from turtle; 
--clear test insertions

select * from turtle;

insert into turtle values(1,'Hurrier','tarish', 2, 20);
insert into turtle values(3,'Hard Shield','quicksilvery', 20, 7);
insert into turtle values(7,'Peace','ridiculously fast', 1, 30);
insert into turtle values(4,'Turtle King','ridiculously fast', 19, 25);
insert into turtle values(5,'MaxAge 2000','slowish', 200, 15);
insert into turtle values(6,'Ninja','normal', 5, 1);
insert into turtle values(2,'Deep Thinker','fast', 100, 10);

select * from turtle;
select weightKg,number,name from turtle;
select * from turtle where speed='fast';
select * from turtle where weightKg=15;
select * from turtle where weightKg=13;

update turtle set name='Hard Shield', age=19 where number=1;
update turtle set weightKg=100, speed='ridiculously slow' where number=6;
update turtle set age=200, name='Peace', speed='normal' where number=7;
update turtle set age=20, name='MaxAge 2000', weightKg=7 where number=1;

delete from turtle where number=5;
delete from turtle where number=2;
delete from turtle where name='Deep Thinker';
delete from turtle where speed='slowish' or name='Turtle King';
delete from turtle where speed='ridiculously slow' or name='MaxAge 2000' or speed='quicksilvery';

select * from turtle;