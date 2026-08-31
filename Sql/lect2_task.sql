create database SchoolDB2;

use schooldb2;

create table students 
(
	studentid int primary key,
    studentName varchar(50),
    age int,
    course varchar(50),
    marks decimal(5,2)
);

insert into students 
values 
(1,"A",12,"python",23),
(2,"B",22,"C ++",13),
(3,"C",42,"java",22),
(4,"D",15,"R",20),
(5,"C",17,"html",25);

select * from students;

create table emp
(
	id int primary key,
    empName varchar(50),
    salary decimal(10,2),
    joindate date,
    working boolean
);

insert into emp 
values 
(1,"goja",23000,"24-04-12",True),
(2,"loja",28000,"26-04-22",false);

select * from emp;