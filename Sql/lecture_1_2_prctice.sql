CREATE DATABASE SchoolDB;

use SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    Marks DECIMAL(5,2)
);

INSERT INTO Students (StudentID, StudentName, Age, Course, Marks)
VALUES 
(1, 'Amit Sharma', 21, 'Data Analytics', 85.50),
(2, 'Neha Gupta', 22, 'Computer Science', 90.75),
(3, 'Ravi Singh', 20, 'Business Analytics', 78.25);

SELECT * FROM Students;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    IsActive BOOLEAN
);

insert into Employees values
(1,"gyan",23444,'2024-02-23',TRUE);

select * from Students where age > 21;

update students 
set StudentName = "Gupta ji"
where StudentID = 2;

delete from students
where StudentID = 2;