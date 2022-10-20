---Create A payroll_service Database---
create database payroll_service;

---To see the created database---
show databases;

---To go to the created database---
use payroll_service;

---Create an employee_payroll table---
create table employee_payroll(
   ID int auto_increment primary key, 
   Name varchar(255),
   Salary float,
   StartDate date);

---Inserting data into employee_payroll table---
insert into employee_payroll(Name, Salary, StartDate) values
   ("Sunil", 50000.00, '2022-09-09'),
   ("Anand", 40000.00, '2022-06-12'),
   ("Ram", 45000.00, '2022-07-15'),
   ("Sita", 40000.00, '2022-05-12'),
   ("Diya", 50000.00, '2022-04-18');

---Retrieve all the data from table---
select * from employee_payroll;

---Retrive Salary of particular employee---
select Salary from employee_payroll where Name="Sunil";

---Retrive Salary of all the employees in a particular date range---
select * from employee_payroll where StartDate between cast('2022-05-12' as date) and DATE(now());

---Add gender to the table after Name field---
alter table employee_payroll add gender char(1) after Name;

---update the gender field in the table---
update employee_payroll set gender= 'M' where Name = "Sunil" or Name = "Anand", or Name = "Ram";
update employee_payroll set gender= 'F' where Name = "Sita" or Name = "Diya";

---Ability to find Sum, Average, Min, Max and Number of male and female employees
select sum(Salary), gender from employee_payroll group by Gender;
select avg(Salary), gender from employee_payroll group by Gender; 
select max(Salary), gender from employee_payroll group by Gender; 
select min(Salary), gender from employee_payroll group by Gender; 
select count(Name), gender from employee_payroll group by Gender;  

-- create department table-----
create table Department(ID int not null primary key, Department varchar(255));
insert into department values(1, "Computer Science"), (2, "Civil"), (3, "Mechanical"), (4, "Electrical");
select * from department;
describe department;

--- create employee_department table----
create table employee_department(Dept_ID int not null , Department varchar(255), EMP_ID int NOT NULL, Name varchar(255), FOREIGN KEY(EMP_ID) REFERENCES employee_payroll(ID), FOREIGN KEY(Dept_ID) REFERENCES department(ID));
insert into employee_department values(1, "Computer Science", 1, "Sunil"),(2,"Civil", 2, "Anand"),(3, "Mechanical", 3,"Ram" ), (4, "Electrical", 4, "Sita"),(1,"Computer Science",5, "Diya" ),(2,"Civil",6, "Rakshit" );
describe employee_department;
show tables;

---- to retreive department data of all the employees----
select * from employee_department;

--- to retreive data from both the table using join---
select ID,Salary,Department from employee_payroll join employee_department on employee_payroll.ID=employee_department.EMP_ID;
select employee_payroll.Name,ID,Salary,Department from employee_payroll join employee_department on employee_payroll.ID=employee_department.EMP_ID;

--- to retreive data of particular department----
select employee_payroll.Name,ID,Salary,Department from employee_payroll join employee_department on employee_payroll.ID=employee_department.EMP_ID where Department="Computer Science";

