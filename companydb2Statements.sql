use companydb2;

select firstname, lastname from department inner join employee on headOfDept=employeeId;

select distinct firstname,lastname from department inner join employee on headOfDept=employeeId;

select firstname,lastname,departmentName from department inner join employee on headOfDept=employeeId;

select concat(firstname,' ',lastname) as `head of department`,departmentName from department inner join employee on headOfDept=employeeId;

