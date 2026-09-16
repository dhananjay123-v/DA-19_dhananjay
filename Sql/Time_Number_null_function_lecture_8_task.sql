
--CREATE DATABASE Functions;
--GO

--USE Functions;
--GO

---- 1. Create Products Table
--CREATE TABLE Products (
--    product_id INT IDENTITY(1,1) PRIMARY KEY,
--    product_name VARCHAR(100),
--    price DECIMAL(10, 4),
--    cost DECIMAL(10, 2),
--    sales DECIMAL(10, 2),
--    profit DECIMAL(10, 2),
--    discount DECIMAL(5, 2) NULL
--);
--GO

---- 2. Create Transactions Table
--CREATE TABLE Transactions (
--    transaction_id INT PRIMARY KEY,
--    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
--    amount DECIMAL(12, 2),
--    profit DECIMAL(12, 2)
--);
--GO

---- 3. Create Orders Table
--CREATE TABLE Orders (
--    order_id INT PRIMARY KEY,
--    order_date DATE,
--    delivery_date DATE NULL,
--    quantity INT,
--    price DECIMAL(10, 2),
--    amount DECIMAL(12, 2) NULL
--);
--GO

---- 4. Create Customers Table
--CREATE TABLE Customers (
--    customer_id INT PRIMARY KEY,
--    customer_name VARCHAR(150),
--    first_name VARCHAR(75),
--    last_name VARCHAR(75) NULL,
--    registration_date DATE,
--    phone VARCHAR(20) NULL,
--    mobile VARCHAR(20) NULL,
--    office_phone VARCHAR(20) NULL,
--    home_phone VARCHAR(20) NULL
--);
--GO

---- 5. Create SalesData Table
--CREATE TABLE SalesData (
--    record_id INT IDENTITY(1,1) PRIMARY KEY,
--    Returns DECIMAL(10, 2),
--    Sales DECIMAL(10, 2)
--);
--GO

---- 6. Create Employees Table
--CREATE TABLE Employees (
--    employee_id INT IDENTITY(1,1) PRIMARY KEY,
--    first_name VARCHAR(50),
--    Salary DECIMAL(10, 2) NULL,
--    phone VARCHAR(20) NULL
--);
--GO


---- 1. Insert data into Products
---- Includes NULL discounts and negative profit to test ABS(), SIGN(), and ISNULL()
--INSERT INTO Products (product_name, price, cost, sales, profit, discount)
--VALUES 
--    ('Laptop', 1200.50, 900.00, 12000.00, 3000.00, 10.00),
--    ('Desk Chair', 150.75, 100.00, 1500.00, 500.00, NULL),
--    ('Wireless Mouse', 25.99, 15.00, 0.00, -50.00, 5.00),
--    ('Monitor', 300.00, 250.00, 3000.00, 500.00, NULL),
--    ('Mechanical Keyboard', 100.00, 120.00, 500.00, -100.00, 15.00);
--GO

---- 2. Insert data into Transactions
---- Includes positive, negative, and zero profits to test SIGN() and ABS()
--INSERT INTO Transactions (transaction_id, transaction_date, amount, profit)
--VALUES 
--    (101, '2026-09-01 10:15:00', 500.00, 150.00),
--    (102, '2026-09-02 11:30:00', 200.00, -20.50),
--    (103, '2026-09-05 14:45:00', 1000.00, 0.00),
--    (104, '2026-09-08 09:00:00', 150.75, -5.00),
--    (105, '2026-09-09 16:20:00', 3000.00, 800.00);
--GO

---- 3. Insert data into Orders
---- Includes NULL delivery dates to test DATEDIFF() with ISNULL() / GETDATE() fallbacks
--INSERT INTO Orders (order_id, order_date, delivery_date, quantity, price, amount)
--VALUES 
--    (1001, '2026-08-15', '2026-08-20', 2, 50.00, 100.00),
--    (1002, '2026-09-01', NULL, 1, 1200.00, 1200.00),
--    (1003, '2026-09-05', '2026-09-08', 5, 20.00, 100.00),
--    (1004, '2026-09-08', NULL, 10, 15.00, 150.00),
--    (1005, '2026-09-09', NULL, 3, 300.00, 900.00);
--GO

---- 4. Insert data into Customers
---- Includes varying NULL contact numbers to test COALESCE() and NULL last names for CONCAT()
--INSERT INTO Customers (customer_id, customer_name, first_name, last_name, registration_date, phone, mobile, office_phone, home_phone)
--VALUES 
--    (1, 'Rahul Sharma', 'Rahul', 'Sharma', '2025-01-15', '555-0101', '555-0101', NULL, NULL),
--    (2, 'Priya Singh', 'Priya', NULL, '2025-06-20', NULL, NULL, '555-0202', '555-0303'),
--    (3, 'Amit Patel', 'Amit', 'Patel', '2026-03-10', NULL, NULL, NULL, NULL),
--    (4, 'Neha Gupta', 'Neha', 'Gupta', '2026-08-05', '555-0404', NULL, NULL, '555-0404'),
--    (5, 'Vikram Desai', 'Vikram', NULL, '2026-09-01', NULL, '555-0505', '555-0606', NULL);
--GO

---- 5. Insert data into SalesData
---- Includes a row where Sales = 0 to test NULLIF() for preventing division by zero
--INSERT INTO SalesData (Returns, Sales)
--VALUES 
--    (50.00, 500.00),
--    (10.00, 100.00),
--    (15.00, 0.00), 
--    (100.00, 2000.00),
--    (0.00, 300.00);
--GO

---- 6. Insert data into Employees
---- Includes NULL salaries and phones to test aggregate functions (AVG, COUNT(column) vs COUNT(*))
--INSERT INTO Employees (first_name, Salary, phone)
--VALUES 
--    ('Suresh', 50000.00, '555-1111'),
--    ('Ramesh', 60000.00, NULL),
--    ('Geeta', NULL, '555-2222'),
--    ('Sunita', 70000.00, NULL),
--    ('Anil', 55000.00, '555-3333');
--GO



--  number function 

-- 1

select 
	abs(p.profit) as profit
from Products as p

-- 2


select 
	round(p.price,2) as price
from Products as p


-- 3

select 
	ceiling(p.price) as price
from Products as p

-- 4


select 
	floor(p.price) as price
from Products as p


--5

select 
	o.quantity,
	square(o.quantity) as sqr_qty
from Orders as o


-- 6
select 
	round(sqrt(o.amount),2) as sqrt
from Orders as o


-- 7

select 
	round(o.quantity*o.price,2) as total_value
from Orders as o

-- 8

select 
	 floor(sign(p.profit)) as statuss
from Products as p

-- 9

select round(rand()* 100,0) as random_num

-- 10

select
	pi() * power(quantity,2) as area
from Orders


-- date & time function 


--select 
--	DATEPART(MONTH, o.order_date) monthh,
--	DATENAME(MONTH, o.order_date) monthh_name,
--	year(o.order_date) yearr,
--	EOMONTH(o.order_date) as end_month,
--	datefromparts(2026,12,3),
--	cast(GETDATE()as time) 
--from Orders as o


-- 11

select getdate()

-- 12

select cast(getdate() as date)

-- 13

select 
	year(o.order_date) as yearr
from Orders as o

-- 14


select 
	datepart(month,o.order_date) as yearr
from Orders as o

-- 15

select 
	datename(month,o.order_date) as yearr
from Orders as o

-- 16

select 
	datename(WEEKDAY,o.order_date) as yearr
from Orders as o


-- 17

select 
	DATEDIFF(day,o.order_date,o.delivery_date)
from Orders as o

-- 18

select 
	dateadd(day,7,o.order_date) as expectd_delevery
from Orders as o

-- 19

select 
	eomonth(o.order_date) as end_date
from Orders as o

-- 20

SELECT 
    order_id,
    order_date,
    YEAR(order_date) AS OrderYear,
    MONTH(order_date) AS OrderMonth
FROM Orders;


-- null function


-- 21

select 
	c.customer_name
from Customers as c
where c.phone is null

-- 22

select 
	c.customer_name
from Customers as c
where c.phone is not null

-- 23

select 
	isnull(c.phone,'Not Avalible')
from Customers as c

-- 24

select 
	isnull(p.discount,0)
from Products as p

-- 25

select 
	c.customer_name,
	coalesce(
		c.home_phone,
		c.office_phone,
		c.mobile,
		'No Contact') as contact
from Customers as c


-- 26

select
	count(*) as totalRow
from Customers

-- 27


select
	count(c.home_phone) as totalRow
from Customers as c


-- 28

select 
	avg(isnull(e.Salary,0)) as avg_salary
from Employees as e


--29

SELECT
    product_name,
    sales,
    cost,
    ROUND(((sales - cost) * 100.0) / NULLIF(sales, 0), 2) AS ProfitPercentage
FROM Products;

-- 30

select 
	o.order_id,
	DATEDIFF(DAY,o.order_date,GETDATE()) as pendingDate
from Orders as o
where o.delivery_date is null

-- Scenario 1

SELECT 
    order_id, 
    order_date, 
    delivery_date, 
    DATEDIFF(day,order_date,isnull(delivery_date,GETDATE())) as deleveryDate
FROM Orders;


-- Scenario 2

SELECT 
    YEAR(order_date) AS OrderYear, 
    MONTH(order_date) AS OrderMonth, 
    DATENAME(MONTH, order_date) AS MonthName, 
    SUM(amount) AS TotalSales
FROM Orders
GROUP BY 
    YEAR(order_date), 
    MONTH(order_date), 
    DATENAME(MONTH, order_date);

-- Scenario 3

	SELECT 
    customer_id,
    customer_name, 
    COALESCE(mobile, office_phone, home_phone, 'No Contact') AS ContactNumber
FROM Customers;

---- Scenario 4

SELECT 
    product_name, 
    sales, 
    cost, 
    (sales - cost) AS Profit,
    ROUND(((sales - cost) * 100.0) / NULLIF(sales, 0), 2) AS ProfitPercentage
FROM Products;

-- Scenario 5

SELECT 
    order_id, 
    quantity, 
    p.price, 
    ISNULL(discount, 0) AS Discount,
    ROUND((quantity * p.price) - ISNULL(discount, 0), 2) AS TotalValue
FROM Orders as o
join Products as p
on o.price=p.price

-- Scenario 6

SELECT 
    transaction_id, 
    transaction_date, 
    DATENAME(MONTH, transaction_date) AS MonthName, 
    EOMONTH(transaction_date) AS MonthEndDate
FROM Transactions;