-- task 1
CREATE DATABASE SalesAnalyticsDB;

USE SalesAnalyticsDB;

-- task 2

CREATE TABLE customers (
    id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    age INT,
    country VARCHAR(50),
    amount_spend INT
);

-- task 3

INSERT INTO Customers (id, user_name, age, country, amount_spend) VALUES
(1, 'Aarav Patel', 28, 'India', 15000),
(2, 'Sarah Jenkins', 34, 'USA', 42000),
(3, 'Kenji Tanaka', 41, 'Japan', 31000),
(4, 'Maria Garcia', 22, 'Spain', 85000),
(5, 'Liam O''Connor', 30, 'Japan', 22000),
(6, 'Chen Wei', 29, 'China', 54000),
(7, 'Chloe Dubois', 25, 'China', 11000),
(8, 'Omar Farooq', 38, 'Japan', 29500),
(10, 'Lucas Silva', 27, 'China', 17500),
(11, 'Mia Rossi', 31, 'USA', 38000),
(12, 'Noah Kim', 36, 'China', 49000),
(13, 'Aisha Khan', 24, 'India', 62000),
(14, 'James Wilson', 52, 'Spain', 73000),
(15, 'Sofia Muller', 29, 'Spain', 26000);

-- task 4

select * from customers;

-- task 5

select user_name , age, country from customers;

-- task 6

select user_name ,country,amount_spend from customers;

-- task 7 — High-Value Customers

select * from customers 
where amount_spend > 50000;

-- Task 8 — Young Customers

select * from customers 
where age < 30;

-- Task 9 — Customers from India

select * from customers 
where country = "India";

-- Task 10 — Low-Spending Customers

select * from customers 
where amount_spend < 20000;

-- Task 11 — High-Spending Young Customers

select * from customers 
where age < 30 and amount_spend > 30000;

-- Task 12 — Indian High-Value Customers

select * from customers 
where country = "India" and amount_spend > 40000;

-- Task 13 — Customers from Selected Countries

select * from customers 
where country in ("India","USA");

-- Task 14 — High Spenders from Selected Countries

select * from customers 
where country in ("India","USA") and amount_spend > 50000;

-- Task 15 — Exclude a Country

select * from customers 
where country != "India";

-- Task 16 — Sort Customers by Spending

select * from customers 
order by amount_spend asc;

-- Task 17 — Identify Top Spenders

select * from customers 
order by amount_spend desc;

-- Task 18 — Sort by Age

select user_name,age,country,amount_spend from customers
order by age asc;

-- Task 19 — Target Customer Segment

select * from customers
where age between 25 and 40
and amount_spend > 30000
and country in ("India","USA")
order by amount_spend desc;

-- Task 20 — Business Analyst Challenge


select * from customers
where age >= 30
and amount_spend > 40000
and country != "India"
order by amount_spend desc;

