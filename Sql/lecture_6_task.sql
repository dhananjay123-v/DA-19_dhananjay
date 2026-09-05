use abc;



-- task 1
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS total_purchased_value,
    AVG(o.amount) AS avg_order_value
FROM Customers AS c
INNER JOIN Orders AS o 
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name,
    c.city
HAVING 
    COUNT(o.order_id) >= 3 
    AND SUM(o.amount) > 75000
ORDER BY 
    total_purchased_value DESC;


-- task 2


SELECT 
    c.city,
    count(c.customer_id) as total_customer,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_quantity,
    SUM(o.amount) AS total_sales_value,
    AVG(o.amount) AS avg_order_value
FROM Customers AS c
INNER JOIN Orders AS o 
    ON c.customer_id = o.customer_id
group by 
    c.city 
having 
    SUM(o.amount) > 100000 
order by 
    total_sales_value desc
    

-- task 3

SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_sales_value,
    Max(o.amount) AS total_sales_value
    
FROM Customers AS c
INNER JOIN Orders AS o 
    ON c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.customer_name,
    c.city 
having 
    Max(o.amount) > 25000 and 
    SUM(o.amount) > 50000 


    -- task 4  blank

    SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    sum(o.quantity) as total_quantity_sold,
    SUM(o.amount) AS total_purchased,
    avg(o.amount) AS avg_order_amount
    
    
FROM Customers AS c
INNER JOIN Orders AS o 
    ON c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.customer_name,
    c.city
having 
    COUNT(o.order_id) > 4
order by
    total_orders asc,
    total_purchased desc
  
  
  
  
  -- task 5


SELECT 
    o.product_name,
    COUNT(o.order_id) AS total_orders,
    sum(o.quantity) as total_quantity_sold,
    SUM(o.amount) AS total_Revenue,
    avg(o.amount) AS avg_order_amount,
    Max(o.amount) AS highest_order_amt
    
FROM Customers AS c
INNER JOIN Orders AS o 
    ON c.customer_id = o.customer_id
group by 
    o.product_name
having 
    COUNT(o.order_id) > 4
order by
    total_Revenue desc
    

    -- task 6  blank

 SELECT 
    o.product_name,
    COUNT(o.order_id) AS total_orders,
    sum(o.quantity) as total_quantity_sold,
    SUM(o.amount) AS total_Revenue
    
FROM Customers AS c
INNER JOIN Orders AS o 
    ON c.customer_id = o.customer_id
group by 
    o.product_name
having 
    sum(o.quantity) > 100 and
    COUNT(o.order_id) > 5


  -- task 7

 SELECT 
    c.city,
    count(distinct o.customer_id) as total_customer,
    COUNT(o.order_id) AS total_orders,
    sum(o.quantity) as total_quantity_sold,
    SUM(o.amount) AS total_Revenue
    
FROM Customers AS c
INNER JOIN Orders AS o 
    ON c.customer_id = o.customer_id
group by 
    c.city
having 
    count(distinct o.customer_id) >=3 and 
    COUNT(o.order_id) >=5 and 
    SUM(o.quantity * o.amount) > 200000;


    -- task 8


SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    count(o.order_id) AS total_orders,
    min(o.amount) AS minimun_value,
    max(o.amount) AS maximun_value,
    avg(o.amount) AS avg_value,
    sum(o.amount) AS total_value
    
FROM Customers AS c
INNER JOIN Orders AS o 
    ON c.customer_id = o.customer_id 
group by 
    c.customer_id,
    c.customer_name,
    c.city
having 
    count(o.order_id) >= 3


-- TASK 9   blank


SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    count(o.order_id) AS total_orders,
    sum(o.quantity) as total_quanity,
    sum(o.amount) AS total_value
    
FROM Customers AS c
left JOIN Orders AS o 
    ON c.customer_id = o.customer_id 
group by
    c.customer_id,
    c.customer_name,
    c.city
having 
    count(o.order_id) >=5
order by
    total_orders desc;
    

-- task 10

SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    count(o.order_id) AS total_orders,
    sum(o.amount) AS total_value
    
FROM Customers AS c
inner JOIN Orders AS o 
    ON c.customer_id = o.customer_id 
group by
    c.customer_id,
    c.customer_name,
    c.city
having 
    count(o.order_id) < 3
order by
    total_value desc;


-- task 11


SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    count(o.order_id) AS numbs_of_orders,
    coalesce(sum(o.quantity),0) as total_quantity,
    coalesce(sum(o.amount),0) AS total_purchased
    
FROM Customers AS c
left JOIN Orders AS o 
    ON c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.customer_name,
    c.city


-- task 12


SELECT 
    c.customer_id, 
    c.customer_name, 
    c.city
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- task 13


SELECT 
    c.customer_id, 
    c.customer_name, 
    c.city,
    count(o.order_id) as total_order,
    coalesce(sum(o.amount),0) as total_purchased
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
group by 
    c.customer_id, 
    c.customer_name, 
    c.city


-- task 14


select 
    p.product_id,
    p.product_name,
    p.category,
    p.price
from 

products as p
left join orders as o
on p.product_name = o.product_name

where 
    o.order_id is null ;
    

    -- task 15


    
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.quantity,
    o.amount
    
FROM Customers AS c
full outer JOIN Orders AS o 
    ON c.customer_id = o.customer_id

-- task 16



SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name,
    o.amount
    
FROM Customers AS c
full outer JOIN Orders AS o 
    ON c.customer_id = o.customer_id
where 
    c.customer_id is null or o.customer_id is null ;


-- task 17


SELECT 
    c.*,
    o.*
FROM Customers AS c
full outer JOIN Orders AS o 
    ON c.customer_id = o.customer_id


-- task 18

    
SELECT 
    c.customer_id,
    c.customer_name,
    c.city
    
FROM Customers AS c
left JOIN Orders AS o 
    ON c.customer_id = o.customer_id
where 
    o.order_id is null ;



-- task 19

select 
    p.*
FROM Products AS p
left JOIN Orders AS o 
    ON p.product_name = o.product_name
where 
    o.order_id is null ;


-- task 20


select 
    c.*
FROM Customers AS c
left JOIN Orders AS o 
    ON c.customer_id = o.customer_id
where 
    o.order_id is null ;


-- task 21



select 
    p.*
FROM Products AS p
left JOIN Orders AS o 
    ON p.product_name = o.product_name
where 
    o.order_id is null 
order by 
    p.price desc



-- task 22


select 
    *
from customers
cross join Products
    

-- task 23

select 
   count(*) as total_combination
from Customers as c
cross join Products as p

-- task 24

--select 
--   c.city,
--   count(p.product_name) as total_product
--from Customers as c
--cross join Products as p
--group by
--    c.city


--select 
--   count(p.product_name) * count(c.city) as total_city_product
--from Customers as c
--cross join Products as p


SELECT distinct
    c.city, 
    p.product_name
FROM Customers c
CROSS JOIN Products p;


-- task 25



select
    c.customer_id,
    c.customer_name,
    c.city,
    count(o.order_id) as total_order,
    sum(o.quantity) as total_quanity,
    sum(o.amount) as total_revenue,
    avg(o.amount) as avg_order_value,
    max(o.amount) as  max_order_value
from Customers as c
inner join Orders as o 
on c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.customer_name,
    c.city
having 
    count(o.order_id) >=3
order by
    total_revenue desc,
    total_order desc,
    avg_order_value desc




-- task 26


select
    p.product_name,
    count(o.order_id) as total_order,
    sum(o.quantity) as total_quanity,
    sum(o.amount) as total_revenue,
    avg(o.amount) as avg_order_value,
    max(o.amount) as  max_order_value
from Products as p
inner join Orders as o 
on p.product_name = o.product_name
group by 
    p.product_name
having 
    count(o.order_id) >=5 and 
    sum(o.amount) > 200000



-- task 27  blank



select
    c.city,
    count(c.customer_id) as total_customer,
    count(o.order_id) as total_order,
    sum(o.quantity) as total_quanity,
    sum(o.amount) as total_revenue,
    avg(o.amount) as avg_order_value
from Customers as c
inner join Orders as o 
on c.customer_id = o.customer_id
group by 
    c.city
having 
    count(c.customer_id) >=5 and
    count(o.order_id) > 10 and
    sum(o.amount) > 500000



-- task 28 blank




select
    c.customer_id,
    c.customer_name,
    c.city,
    count(o.order_id) as total_qualify_order,
    sum(o.amount) as total_qualify_value
from Customers as c
inner join Orders as o 
on c.customer_id = o.customer_id
where 
    o.amount > 25000
group by 
    c.customer_id,
    c.customer_name,
    c.city
having 
    count(o.order_id) >= 2



-- task 29  blank


select
    p.product_name,
    count(o.order_id) as total_order,
    sum(o.quantity) as total_quanity,
    sum(o.amount) as total_revenue,
    avg(o.amount) as avg_order_value
from Products as p
inner join Orders as o 
on p.product_name = o.product_name
group by 
    p.product_name
having 
    sum(o.quantity) > 100 and
    count(o.order_id) >=5 and
    sum(o.amount) > 100000





-- task 30  blank
-- using sum(o.amount)

select
    c.customer_id,
    c.customer_name,
    c.city,
    count(o.order_id) as total_order,
    sum(o.quantity) as total_quanity,
    sum(o.amount) as total_revenue,
    avg(o.amount) as avg_order_value,
    min(o.amount) as  min_order_value,
    max(o.amount) as  max_order_value
from Customers as c
inner join Orders as o 
on c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.customer_name,
    c.city
having 
    count(o.order_id) >=3 and
    sum(o.amount) > 100000
order by
    total_revenue desc;






-- task 30  
-- using sum(o.amount * o.quantity)

select
    c.customer_id,
    c.customer_name,
    c.city,
    count(o.order_id) as total_order,
    sum(o.quantity) as total_quanity,
    sum(o.amount * o.quantity) as total_revenue,
    avg(o.amount) as avg_order_value,
    min(o.amount) as  min_order_value,
    max(o.amount) as  max_order_value
from Customers as c
inner join Orders as o 
on c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.customer_name,
    c.city
having 
    count(o.order_id) >=3 and
    sum(o.amount * o.quantity) > 100000
order by
    total_revenue desc;



