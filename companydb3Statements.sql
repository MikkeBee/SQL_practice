use compandydb3;

select * from department;
select * from employee;
select * from headOfDepartment;

select firstname,lastname,departmentName as `head of department` from employee 
inner join headOfDepartment on headOfDepartment.employeeId=employee.employeeId 
inner join department on headOfDepartment.departmentId=department.departmentId
order by lastname,firstname,departmentName;

select lastname,firstname,departmentName from employee
left join headOfDepartment on headOfDepartment.employeeId=employee.employeeId
left join department on headOfDepartment.departmentId=department.departmentId;

select lastname,firstname,departmentName from employee
left join headOfDepartment on headOfDepartment.employeeId=employee.employeeId
left join department on headOfDepartment.departmentId=department.departmentId
where departmentName is null;

select lastname,firstname from employee
left join headOfDepartment on headOfDepartment.employeeId=employee.employeeId
where departmentId is null;

select distinct lastname,firstname from employee
left join headOfDepartment on headOfDepartment.employeeId=employee.employeeId
where departmentId is not null;

select distinct lastname,firstname from employee
inner join headOfDepartment on headOfDepartment.employeeId=employee.employeeId;

delete from headOfDepartment where departmentId=5;

select departmentName from department
left join headOfDepartment on headOfDepartment.departmentId=department.departmentId;

select departmentName from department
left join headOfDepartment on headOfDepartment.departmentId=department.departmentId
where headOfDepartment.departmentId is null;

select count(departmentName) from department
inner join headOfDepartment on headOfDepartment.departmentId=department.departmentId;

