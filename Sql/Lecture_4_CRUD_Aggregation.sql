create database customer_db_2;

use customer_db_2;

CREATE TABLE sales_transactions (
    transaction_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    unit_price INT,
    discount_percent INT,
    city VARCHAR(50),
    payment_mode VARCHAR(30),
    salesperson VARCHAR(50),
    customer_type VARCHAR(30)
);

INSERT INTO sales_transactions (transaction_id, customer_name, product_name, category, quantity, unit_price, discount_percent, city, payment_mode, salesperson, customer_type) VALUES
(1001, 'Aarav Mehta', 'Laptop Pro 15', 'Electronics', 2, 75000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1002, 'Priya Shah', 'Office Chair', 'Furniture', 5, 12000, 8, 'Mumbai', 'Card', 'Neha', 'Regular'),
(1003, 'Rohan Patel', 'Smartphone X', 'Electronics', 3, 45000, 12, 'Ahmedabad', 'UPI', 'Amit', 'Premium'),
(1004, 'Sneha Verma', 'Refrigerator', 'Appliances', 1, 68000, 15, 'Delhi', 'Card', 'Priya', 'VIP'),
(1005, 'Karan Joshi', 'Dining Table', 'Furniture', 4, 18000, 5, 'Pune', 'Cash', 'Rahul', 'Regular'),
(1006, 'Ananya Rao', 'Laptop Air 14', 'Electronics', 1, 62000, 7, 'Bangalore', 'Online', 'Neha', 'Premium'),
(1007, 'Vikram Singh', 'Washing Machine', 'Appliances', 2, 42000, 18, 'Jaipur', 'UPI', 'Amit', 'Regular'),
(1008, 'Meera Kapoor', 'Smartphone Pro', 'Electronics', 4, 55000, 20, 'Mumbai', 'Card', 'Priya', 'VIP'),
(1009, 'Aditya Shah', 'Sofa Set', 'Furniture', 3, 35000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1010, 'Ishita Patel', 'Air Conditioner', 'Appliances', 2, 58000, 12, 'Surat', 'UPI', 'Neha', 'Premium'),
(1011, 'Raj Malhotra', 'Gaming Laptop', 'Electronics', 2, 95000, 15, 'Delhi', 'Card', 'Amit', 'VIP'),
(1012, 'Kavya Desai', 'Bookshelf', 'Furniture', 6, 9000, 5, 'Pune', 'Cash', 'Priya', 'Regular'),
(1013, 'Arjun Mehta', 'Smart TV 55', 'Electronics', 2, 72000, 18, 'Bangalore', 'Online', 'Rahul', 'Premium'),
(1014, 'Nisha Sharma', 'Microwave Oven', 'Appliances', 3, 22000, 8, 'Ahmedabad', 'UPI', 'Neha', 'Regular'),
(1015, 'Yash Patel', 'Refrigerator Pro', 'Appliances', 1, 82000, 20, 'Mumbai', 'Card', 'Amit', 'VIP'),
(1016, 'Simran Kaur', 'Office Desk', 'Furniture', 5, 16000, 12, 'Delhi', 'Online', 'Priya', 'Regular'),
(1017, 'Dev Kumar', 'Smartphone Ultra', 'Electronics', 3, 68000, 10, 'Jaipur', 'UPI', 'Rahul', 'Premium'),
(1018, 'Riya Shah', 'Washing Machine Pro', 'Appliances', 4, 48000, 22, 'Surat', 'Card', 'Neha', 'Premium'),
(1019, 'Manav Joshi', 'Premium Sofa', 'Furniture', 2, 65000, 15, 'Ahmedabad', 'Online', 'Amit', 'VIP'),
(1020, 'Pooja Mehta', 'Tablet Pro', 'Electronics', 5, 32000, 8, 'Pune', 'UPI', 'Priya', 'Regular'),
(1021, 'Harsh Verma', 'Laptop Ultra', 'Electronics', 3, 88000, 25, 'Mumbai', 'Card', 'Rahul', 'VIP'),
(1022, 'Neel Shah', 'Air Conditioner Pro', 'Appliances', 2, 76000, 10, 'Delhi', 'Online', 'Neha', 'Premium'),
(1023, 'Tanvi Rao', 'Dining Set', 'Furniture', 4, 28000, 18, 'Bangalore', 'Cash', 'Amit', 'Regular'),
(1024, 'Siddharth Patel', 'Smart TV Pro', 'Electronics', 6, 60000, 12, 'Surat', 'UPI', 'Priya', 'Premium'),
(1025, 'Aisha Khan', 'Double Door Refrigerator', 'Appliances', 2, 92000, 20, 'Ahmedabad', 'Card', 'Rahul', 'VIP'),
(1026, 'Mohit Singh', 'Executive Chair', 'Furniture', 7, 14000, 10, 'Jaipur', 'Online', 'Neha', 'Regular'),
(1027, 'Diya Mehta', 'Gaming Monitor', 'Electronics', 3, 52000, 15, 'Delhi', 'UPI', 'Amit', 'Premium'),
(1028, 'Varun Shah', 'Washing Machine', 'Appliances', 5, 38000, 28, 'Mumbai', 'Cash', 'Priya', 'Regular'),
(1029, 'Isha Patel', 'Luxury Sofa', 'Furniture', 3, 78000, 12, 'Pune', 'Card', 'Rahul', 'VIP'),
(1030, 'Dhruv Sharma', 'Business Laptop', 'Electronics', 2, 110000, 18, 'Bangalore', 'Online', 'Neha', 'VIP');

-- task 1

SELECT 
    COUNT(transaction_id) AS total_transaction,
    SUM(quantity) AS total_quantity,    
    SUM(quantity * unit_price) AS total_value,
    avg(unit_price) as avg_unit_pr,
    max(unit_price) as highest_unit_price,
    min(unit_price) as lowest_unit_price

FROM 
    sales_transactions;


-- task 2


SELECT 
    category,
    COUNT(transaction_id) AS num_transactions,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY category
ORDER BY total_sales_value DESC;

-- task 3

SELECT 
    salesperson,
    COUNT(transaction_id) AS num_transactions,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY salesperson
ORDER BY total_sales_value DESC;


-- task 4

SELECT 
    city,
    COUNT(transaction_id) AS num_transactions,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY city
ORDER BY total_sales_value DESC;


-- task 5

SELECT 
    customer_type,
    COUNT(transaction_id) AS num_transactions,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY customer_type
ORDER BY total_sales_value DESC;


-- task 6

SELECT 
    payment_mode,
    COUNT(transaction_id) AS num_transactions,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY payment_mode
ORDER BY total_sales_value DESC;


-- task 7

SELECT 
    category,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY category
having SUM(quantity * unit_price) > 300000
ORDER BY total_sales_value DESC;


-- task 8

SELECT 
    salesperson,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY salesperson
having SUM(quantity * unit_price) > 500000
ORDER BY total_sales_value DESC;


-- task 9


SELECT 
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY product_name
having SUM(quantity) > 5
ORDER BY total_quantity DESC;

-- task 10

SELECT 
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
where customer_type='Premium'
GROUP BY transaction_id
having SUM(quantity * unit_price) > 200000;


-- task 11


SELECT 
    salesperson,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value
    
FROM sales_transactions
where customer_type='VIP'
GROUP BY salesperson
having SUM(quantity * unit_price) > 300000;


-- task 12


SELECT 
    city,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value
    
FROM sales_transactions
where payment_mode in ('Online','Card')
GROUP BY city
having SUM(quantity * unit_price) > 300000;


-- task 13


SELECT 
    discount_percent,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
FROM sales_transactions
GROUP BY discount_percent
having count(transaction_id) >=2


-- task 14


SELECT 
    salesperson,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price,
    max(unit_price) as highest_unit_price
FROM sales_transactions
where category='Electronics'
GROUP BY salesperson
having SUM(quantity * unit_price) >  250000


-- task 15


SELECT 
    city,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
    
FROM sales_transactions
where category='Furniture' and quantity > 2
GROUP BY city
having SUM(quantity * unit_price) >  50000


-- task 16


SELECT 
    salesperson,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price
    
FROM sales_transactions
where category='Appliances' and payment_mode !='Cash' and discount_percent < 20
GROUP BY salesperson
having SUM(quantity * unit_price) >  100000


-- task 17

SELECT 
    customer_type,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price,
    max(unit_price) as highest_unit_price
FROM sales_transactions
where customer_type in ('Premium','VIP')
GROUP BY customer_type
order by total_sales_value desc
    
-- task 18


SELECT 
    salesperson,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(discount_percent) AS average_dis_price
    
FROM sales_transactions
where discount_percent > 15
GROUP BY salesperson
having count(transaction_id) >= 2


-- task 19

insert into sales_transactions values
(1031,'Raj Mehta','MacBook Pro','Electronics',2,125000,10,'Mumbai','Online','Rahul','Premium');


select * from sales_transactions;


-- task 20

SELECT 
    salesperson,
    category,
    count(transaction_id) as num_transaction,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price,
    max(unit_price) as highest_unit_price,
    min(unit_price) as minimum_unit_price,
    avg(discount_percent) as avg_discount_per
FROM 
    sales_transactions
where  
(
    (customer_type = 'Premium' or customer_type ='VIP')and
    (payment_mode != 'Cash')and
    (quantity > 1)and
    (discount_percent < 20)
)
GROUP BY 
    salesperson,
    category
having 
    SUM(quantity * unit_price) >  200000
order by
    total_sales_value desc


/* 

SELECT 
    salesperson,
    category,
    COUNT(transaction_id) AS num_transactions,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales_value,
    AVG(unit_price) AS average_unit_price,
    MIN(unit_price) AS min_unit_price,
    MAX(unit_price) AS max_unit_price,
    AVG(discount_percent) AS average_discount_percent
FROM sales_transactions
WHERE customer_type IN ('Premium', 'VIP') 
  AND payment_mode != 'Cash' 
  AND quantity > 1 
  AND discount_percent < 20
GROUP BY salesperson, category
HAVING SUM(quantity * unit_price) > 200000
ORDER BY total_sales_value DESC;

*/



-- additional


select * from sales_transactions

update sales_transactions
set discount_percent = 12 
where transaction_id=1031

delete sales_transactions
where transaction_id=1031