create database salesanalyticsdb2;

use salesanalyticsdb2;

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT
);

INSERT INTO Employees (id, name, department, salary, age) VALUES
(1, 'Amit', 'IT', 60000, 28),
(2, 'Sneha', 'HR', 45000, 25),
(3, 'Raj', 'Finance', 70000, 32),
(4, 'Simran', 'IT', 52000, 27),
(5, 'Karan', 'Marketing', 40000, 24);

select * from employees 
where salary > 40000;

select * from employees 
where department = "IT";

select * from employees 
where age between 25 and 30;

select * from employees 
where name like "S%";

select * from employees 
order by salary desc
limit 3;

select * from employees 
where not department = "HR";