use companydb;

select * from department;
select * from employee;
select salary from employee where firstname='Mary' and lastname='River';

select departmentName from employee,department where departmentNumber=departmentId and firstname='Mary';

select firstname,lastname,departmentName from employee,department where departmentNumber=departmentId and departmentName='ict';

select  firstname,lastname,departmentName from employee,department where employee.departmentNumber=department.departmentId and departmentName='ict';

select firstname,lastname,departmentName from employee 
inner join department on employee.departmentNumber=department.departmentId 
where departmentName='ict';

--(dont use)
select * from employee
inner join department on departmentNumber=departmentId;  
--(dont use)

select lastname,firstname,departmentName,departmentFloor from employee
inner join department on employee.departmentNumber=department.departmentId;

select lastname,firstname,departmentName,departmentFloor from employee
inner join department on employee.departmentNumber=department.departmentId
order by departmentFloor asc;

select firstname,departmentName,departmentFloor,salary from employee 
inner join department on employee.departmentNumber=department.departmentId 
where firstname='Amanda';

select avg(salary) as 'ict average' from employee where departmentNumber=1;

select avg(salary) as average from employee
inner join department on departmentNumber=departmentId
where departmentName='ict';

select firstname,lastname,departmentName,salary from employee
inner join on departmentNumber=departmentId
where salary=(select min(salary) from employee);

select firstname,lastname,departmentName,salary from employee
inner join department on departmentNumber=departmentId
where salary>(select avg(salary) from employee);

select firstname,lastname,departmentName,salary, case
when salary>(select avg(salary) from employee) then 'above average'
when salary<(select avg(salary) from employee) then 'below average'
else 'average' end as "salary level" from employee
inner join department on departmentNumber=departmentId;