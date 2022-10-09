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
