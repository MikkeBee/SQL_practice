use companydb5;

select * from department;
select * from employee;
select * from workerPosition;
select * from workerOfDepartment;

select lastname, firstname, departmentName, positionName from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId=department.departmentId
inner join workerPosition on workerOfDepartment.positionId=workerPosition.positionId
order by lastname asc, firstname asc, departmentName asc;

select lastname, firstname, departmentName, positionName from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId=department.departmentId
inner join workerPosition on workerOfDepartment.positionId=workerPosition.positionId
where positionName='leader'
order by lastname asc, firstname asc, departmentName asc;

select lastname, firstname, departmentName, positionName from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId=department.departmentId
inner join workerPosition on workerOfDepartment.positionId=workerPosition.positionId
where positionName='worker'
order by lastname asc, firstname asc, departmentName asc;

select lastname, firstname, departmentName, positionName from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId=department.departmentId
inner join workerPosition on workerOfDepartment.positionId=workerPosition.positionId
where positionName='worker' and departmentName='ict'
order by lastname asc, firstname asc, departmentName asc;

select lastname, firstname, departmentName, positionName from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId=department.departmentId
inner join workerPosition on workerOfDepartment.positionId=workerPosition.positionId
where departmentName='ict'
order by lastname asc, firstname asc, departmentName asc;

select lastname, firstname, departmentName, case
 when positionName='leader' then 'boss' else '' end as lead
 from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId=department.departmentId
inner join workerPosition on workerOfDepartment.positionId=workerPosition.positionId
where departmentName='ict'
order by lead desc, lastname asc, firstname asc;

select lastname, firstname, departmentName, case
 when positionName='leader' then 'boss' else '' end as lead
 from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId=department.departmentId
inner join workerPosition on workerOfDepartment.positionId=workerPosition.positionId
order by departmentName asc, lead desc, lastname asc, firstname asc;

select departmentName,lastname, firstname, case
 when positionName='leader' then 'boss' else '' end as lead
 from employee
inner join workerOfDepartment on workerOfDepartment.employeeId=employee.employeeId
inner join department on workerOfDepartment.departmentId=department.departmentId
inner join workerPosition on workerOfDepartment.positionId=workerPosition.positionId
order by departmentName asc, lead desc, lastname asc, firstname asc;