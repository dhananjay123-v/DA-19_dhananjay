create database Clauses_Aggregate_Functions


use Clauses_Aggregate_Functions

CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  course VARCHAR(20),
  marks INT
);

INSERT INTO students VALUES
(1, 'Aman', 'BCA', 75),
(2, 'Neha', 'MCA', 90),
(3, 'Karan', 'BCA', 65),
(4, 'Riya', 'BBA', 80),
(5, 'Meena', 'MCA', 88);


-- task 1

select count(id) as total_student
from students

-- task 2

select min(marks) as minimum_mark, max(marks) as maximum_mark
from students

-- task 3

select name,sum(marks) as total_marks
from students
group by name

-- task 4

select course,avg(marks) as avg_mark
from students
group by course

-- task 5


select course,avg(marks) as avg_mark
from students
group by course
having avg(marks) > 80

-- task 6

select top 2 name ,marks
from students
order by marks desc

-- task 7

select name ,marks
from students
where marks between 60 and 90

-- task 8

select name,course
from students
where course in ('MCA','BCA')

-- task 9

select count(distinct(id)) as total_uniqe_customer
from students


-- task 10

select name
from students
where name like 'N%'