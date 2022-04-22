use employeedb;

select * from employee;
select firstname, lastname from employee;
select lastname from employee;
select distinct lastname from employee;
select * from employee where lastname='River';
select * from employee where lastname='River' and firstname='Vera';
select * from employee where lastname='River' or firstname='Amanda';
select firstname,lastname, employeeId from employee where salary is null;
select firstname,lastname, employeeId from employee where salary is not null;
select * from employee order by lastname asc;
select * from employee order by lastname asc, firstname asc;
select lastname,firstname, employeeID,department,salary from employee order by lastname asc, firstname asc;
select lastname,firstname, employeeID,department,salary from employee order by lastname desc, firstname desc;
select * from employee where salary<6000;
select lastname, firstname from employee order by lastname, firstname desc;
select lastname, firstname from employee order by lastname desc, firstname desc;
select * from employee order by salary;
select firstname, department from employee where department is not null;
select count(*) from employee;
select count(*) as rowcount from employee;
select count(department) from employee;
select count(*)-count(department) as "missing department" from employee;
select count(*) as "department missing" from employee where department is null;
select lastname, count(*) as amount from employee group by lastname having count(*) >=2;
select lastname, count(*) as amount from employee group by lastname order by lastname asc;
select sum(salary) as total from employee;
select min(salary) as minimum, max(salary) as maximum from employee;
select avg(salary) as average from employee;
select round(avg(salary),2) as average from employee;
select * from employee where firstname like '_e%';
select * from employee where firstname like '%y%';
select * from employee where firstname like 'Mary_Ann';
-- Something similar to
select * from employee where firstname like 'Mary\_Ann';
-- Exact match with underscore
select * from employee where firstname='Mary_Ann';
-- anything that starts with Mary and ends however
select * from employee where firstname like 'Mary_%';
select * from employee where salary between 3000 and 7000 order by salary asc;
select * from employee where salary>=3000 and salary<=7000 order by salary desc;
select * from employee where lastname in ('Smith','Jones');
select * from employee where lastname='Smith' or lastname='Jones';
select * from employee where lastname not in ('Smith','Jones');
select * from employee where lastname !='Smith' and lastname !='Jones';
select * from employee where lastname<>'Smith' and lastname<>'Jones';
select lastname,firstname from employee where salary=(select min(salary) from employee);
select firstname,lastname from employee where salary<(select avg(salary) from employee);
-- shows all salaries below the average salary
select firstname,lastname, salary from employee where salary>=(select avg(salary) from employee);

select firstname,lastname,case
when salary is null then 'salary missing'
when salary=(select min(salary) from employee) then 'min'
when salary=(select max(salary) from employee) then 'max'
else '' end as 'minmax' from employee;

select firstname,lastname,case
    -> when salary is null then 'salary missing'
    -> when salary=(select min(salary) from employee) then 'min'
    -> when salary=(select max(salary) from employee) then 'max'
    -> end as 'minmax' from employee;

update employee set department='ict', salary=4000 where employeeId=4;
update employee set salary=6000 where employeeId=3;
update employee set salary=1.1*salary where employeeId=xxx;
update employee set salary=1.1*salary where department='ict';


delete from employee where employeeId=7;
delete from employee where department='finance';
delete from employee where salary>=7000;
delete from employee where department='security' or lastname='River';
delete from employee;


