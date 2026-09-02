Create DATABASE JoinPracticeDB;

CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);


INSERT INTO Customer
(customer_id, customer_name, city, country)
VALUES
(1, 'Rahul Sharma', 'Ahmedabad', 'India'),
(2, 'Priya Patel', 'Mumbai', 'India'),
(3, 'Amit Shah', 'Delhi', 'India'),
(4, 'Neha Mehta', 'Pune', 'India'),
(5, 'Rohan Desai', 'Surat', 'India'),
(6, 'Karan Joshi', 'Jaipur', 'India'),
(7, 'Sneha Patel', 'Bangalore', 'India'),
(8, 'Vikas Shah', 'Vadodara', 'India'),
(9, 'Anjali Singh', 'Delhi', 'India'),
(10, 'Raj Malhotra', 'Chennai', 'India');


CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2)
);

INSERT INTO Orders
(order_id, customer_id, product_name, quantity, amount)
VALUES
(101, 1, 'Laptop', 1, 55000.00),
(102, 2, 'Mobile', 2, 30000.00),
(103, 3, 'Keyboard', 3, 4500.00),
(104, 4, 'Monitor', 1, 18000.00),
(105, 5, 'Mouse', 5, 2500.00),
(106, 6, 'Printer', 1, 12000.00),
(107, 7, 'Laptop Bag', 2, 3000.00),
(108, 11, 'Tablet', 1, 25000.00),
(109, 12, 'Headphones', 2, 6000.00),
(110, 13, 'Smart Watch', 1, 8000.00);


SELECT * FROM Customer;

SELECT * FROM Orders;


-- TASK 1

select 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.amount
from Customer AS C
Inner join Orders AS O
on C.customer_id = O.customer_id;


-- task 2

select 
    c.customer_name,
    c.city,
    o.product_name,
    o.amount
from Customer AS C
inner join Orders AS O
on C.customer_id = O.customer_id;


-- task 3

select 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer AS C
left join Orders AS O
on C.customer_id = O.customer_id;


-- task 4

select 
    c.customer_id,
    c.customer_name,
    c.city
from Customer AS C
left join Orders AS O
on C.customer_id = O.customer_id
where o.order_id is null

-- task 5


select 
    o.order_id,
    c.customer_id,
    c.customer_name,
    o.product_name,
    o.amount
from Customer AS C
right join Orders AS O
on C.customer_id = O.customer_id;


-- task 6

select distinct
    o.order_id,
    c.customer_id,
    o.product_name,
    o.amount
from Customer AS C
right join Orders AS O
on C.customer_id = O.customer_id;



-- task 7

select 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer AS C
full outer join Orders AS O
on C.customer_id = O.customer_id;


-- task 8


select 
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer AS C
inner join Orders AS O
on C.customer_id = O.customer_id
where o.amount > 10000


-- task 9


select 
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.amount
from Customer AS C
inner join Orders AS O
on C.customer_id = O.customer_id
where c.city='Delhi'


-- task 10

select 
    c.customer_name,
    o.product_name,
    o.quantity,
    o.amount
from Customer AS C
inner join Orders AS O
on C.customer_id = O.customer_id
where o.quantity > 2

-- task 11


select 
    c.customer_id,
    c.customer_name,
    sum(o.amount) as total_amount
from Customer AS C
left join Orders AS O
on C.customer_id = O.customer_id
group by 
c.customer_id,
c.customer_name

-- task 12


select 
    c.customer_id,
    c.customer_name,
    count(o.order_id) as total_order
from Customer AS C
left join Orders AS O
on C.customer_id = O.customer_id
group by 
c.customer_id,
c.customer_name


--task 13

select 
    c.customer_name,
    avg(o.amount) as total_amount
from Customer AS C
inner join Orders AS O
on C.customer_id = O.customer_id
group by 
c.customer_name


-- task 14


select 
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer AS C
inner join Orders AS O
on C.customer_id = O.customer_id
order by o.amount desc


-- task 15

select 
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer AS C
inner join Orders AS O
on C.customer_id = O.customer_id
order by o.amount asc


-- task 16

select 
    c.customer_id,
    c.customer_name,
    count(o.order_id) as total_order,
    count(o.quantity) as total_quantity,
    sum(o.amount) as total_amount
from Customer AS C
left join Orders AS O
on C.customer_id = O.customer_id
group by
        c.customer_id,
        c.customer_name


-- task 17



select 
    c.customer_name,
    sum(o.amount) as total_amount
from Customer AS C
left join Orders AS O
on C.customer_id = O.customer_id
group by
        c.customer_name
having 
        sum(o.amount) > 20000


-- task 18


select 
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
from Customer AS C
inner join Orders AS O
on C.customer_id = O.customer_id
order by o.amount asc





