

use SQL_Advanced_Joins_Test;


-- q1

select 
	c.customer_name,
	c.city,
	c.customer_segment,
	o.order_id,
	o.order_date,
	o.order_status
from 
	Customers as c
inner join 
	Orders as o
on c.customer_id = o.customer_id
where 
	o.order_date >= '2025-01-01' and o.order_date < '2026-01-01'

-- q2

select 
	c.customer_name,
	c.city,
	c.customer_segment
from 
	Customers as c
inner join 
	Orders as o
on c.customer_id = o.customer_id
where 
	c.state ='Gujarat' and
	c.customer_segment in ('Premium','Enterprise')


	-- q3

select 
	p.product_name,
	(p.unit_price*p.stock_quantity) as total_value
from 
	Products as p
where 
	p.unit_price between 5000 and 20000
order by
	total_value desc


--q4

select
	o.order_id,
	o.customer_id,
	o.product_id,
	o.quantity,
	o.order_date
from Orders as o
where 
	o.quantity > 4

-- 5


select top 5
	p.product_name,
	p.category,
	p.unit_price
from Products as p
order by
	p.unit_price desc


-- q6

select 
	c.customer_segment,
	count(distinct(c.customer_id)) as total_customer 
from 
	Customers as c
group by 
	c.customer_segment



-- q7

select top 5
	p.product_name,
	sum(p.stock_quantity) as total_quantity
from Products as p
group by
	p.product_name

-- q8

select top 5
	p.category,
	avg(p.unit_price) as avg_unit_price
from Products as p
group by
	p.category

-- q9

select top 5
	p.category,
	avg(p.unit_price) as avg_unit_price
from Products as p

group by
	p.category
having
	avg(p.unit_price) > 10000

-- q10

select
	o.customer_id,
	count(o.order_id) as total_order
from Orders as o
group by
	o.customer_id
having 
	count(o.order_id) >=3


-- q11

select

	c.customer_name,
	o.order_id,
	p.product_name,
	p.category,
	p.stock_quantity,
	p.unit_price,
	(p.stock_quantity*p.unit_price) as total_value


from	Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id


-- q12
	

select

	c.customer_name,
	p.product_name,
	p.category,
	p.stock_quantity,
	p.unit_price,
	(p.stock_quantity*p.unit_price) as total_value


from	Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id


-- q13

select

	c.customer_name,
	sum(p.stock_quantity*p.unit_price) as total_value


from	Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id

group by
	c.customer_name


-- q14

select

	p.category,
	sum(p.stock_quantity*p.unit_price) as total_value


from	Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id

group by
	p.category


-- q15

select

		e.employee_name,
		e.department,
		count(o.order_id) as total_order

from 
	Employees as e
inner join Orders as o
on e.employee_id = o.sales_employee_id
group by
	e.employee_name,
	e.department

-- q 16

select

		e.employee_name,
		e.department,
		count(o.order_id) as total_order

from 
	Employees as e
inner join Orders as o
on e.employee_id = o.sales_employee_id
group by
	e.employee_name,
	e.department
having 
	count(o.order_id) > 8

-- q.17

select 
	c.customer_name,
	o.order_id,
	o.order_status

from 
	Customers as c
left join Orders as o
on c.customer_id = o.customer_id

-- q18

select 
	c.customer_name


from 
	Customers as c
left join Orders as o
on c.customer_id = o.customer_id

where 
	o.order_id is null


-- q19


select 
	p.product_name,
	p.category
from 
	Products as p
left join Orders as o
on p.product_id = o.product_id

where 
	o.order_id is null

-- q20

select 
	p.product_name,
	sum(p.stock_quantity) as total_quanity
from 
	Products as p
left join Orders as o
on p.product_id = o.product_id
group by
	p.product_name


-- q21

select

	p.category,
	sum(p.stock_quantity*p.unit_price) as total_value


from	Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id

group by
	p.category
having
	sum(p.stock_quantity*p.unit_price) > 150000


-- q22


select

	c.customer_name,
	o.order_status,
	count(distinct(o.order_id)) as total_oder,
	coalesce(sum(p.stock_quantity*p.unit_price),0) as total_value


from	Customers as c
left  join Orders as o
on c.customer_id = o.customer_id
left join Products as p
on o.product_id = p.product_id

where 
	o.order_status  not in  ('completed')

group by
	c.customer_name,
	o.order_status


-- q23

select top 5

	c.customer_name,
	o.order_status,
	coalesce(sum(p.stock_quantity*p.unit_price),0) as total_value


from	Customers as c
left  join Orders as o
on c.customer_id = o.customer_id
left join Products as p
on o.product_id = p.product_id

where 
	o.order_status  in  ('completed')

group by
	c.customer_name,
	o.order_status

-- q24

select

	p.category,
	sum(o.quantity) as total_quanity
	

from	Customers as c
left  join Orders as o
on c.customer_id = o.customer_id
left join Products as p
on o.product_id = p.product_id

group by
	p.category


-- 25

select

	c.customer_name,
	o.order_id,
	o.order_status,
	pp.paid_amount,
	pp.payment_status
	

from	

Customers as c
inner  join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id
inner join Payments as pp
on o.order_id=pp.order_id



-- 26




select

	c.customer_name,
	o.order_id,
	o.order_status,
	pp.paid_amount,
	pp.payment_status
	

from	

Customers as c
inner  join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id
inner join Payments as pp
on o.order_id=pp.order_id

where 
	pp.payment_status not in ('Paid')

-- 27

select

	c.customer_name,
	s.ticket_id
	

from	

Customers as c
left  join Orders as o
on c.customer_id = o.customer_id
left join SupportTickets as s
on s.customer_id=c.customer_id

where 
	s.ticket_id is null



-- 28

select distinct

	c.customer_name,
	s.ticket_id
	

from	

Customers as c
left  join Orders as o
on c.customer_id = o.customer_id
join SupportTickets as s
on s.customer_id=c.customer_id

where 
	o.order_id is null

-- 29

select
	e.employee_name,
	count(ss.ticket_id) as total_ticket
from	

Employees as e
left join SupportTickets as ss
on e.employee_id=ss.employee_id
group by
	e.employee_name


--30

select
	e.employee_name,
	count(ss.ticket_id) as total_ticket
from	

Employees as e
left join SupportTickets as ss
on e.employee_id=ss.employee_id
group by
	e.employee_name
having 
	 count(ss.ticket_id) > 2

-- 31

select
	c.customer_name,
	o.order_id,
	p.product_name,
	e.employee_name,
	e.department,
	o.quantity,
	(o.quantity*p.unit_price) as total_value
from	
Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id
inner join Employees as e
on e.employee_id=o.sales_employee_id

-- 32

select
	e.employee_name,
	sum(o.quantity*p.unit_price) as total_value
from	
Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id
inner join Employees as e
on e.employee_id=o.sales_employee_id

where
	o.order_status IN ('Completed')
group by
	e.employee_name


-- 33

select
	e.employee_name,
	sum(o.quantity*p.unit_price) as total_value
from	
Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id
inner join Employees as e
on e.employee_id=o.sales_employee_id

where
	o.order_status IN ('Completed')
group by
	e.employee_name
having 
	sum(o.quantity*p.unit_price) > 500000


-- 34

select
	c.city,
	sum(o.quantity*p.unit_price) as total_value
from	
Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id


where
	o.order_status IN ('Completed')
group by
	c.city


-- 35

select
	c.city,
	sum(o.quantity*p.unit_price) as total_value
from	
Customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Products as p
on o.product_id = p.product_id


where
	o.order_status IN ('Completed')
group by
	c.city
having 
	sum(o.quantity*p.unit_price) > 300000


-- 36


select 

c.customer_id,
c.customer_name,
o.order_id,
s.ticket_id
from 
	Customers as c
full outer join Orders as o
on c.customer_id=o.customer_id
full outer join SupportTickets as s
on c.customer_id=s.customer_id


-- 37

select distinct

c.customer_id,
o.order_id,
s.ticket_id

from 
	Customers as c
full outer join Orders as o
on c.customer_id=o.customer_id
full outer join SupportTickets as s
on c.customer_id=s.customer_id

where 
	o.order_id is not null OR s.ticket_id is not null 


-- 38



select
	e.employee_name,
	o.order_id,
	sum(o.quantity*p.unit_price) as total_value
from Employees as e
right join Orders as o
on e.employee_id = o.sales_employee_id
right join Products as p
on o.product_id=p.product_id
group by 
	e.employee_name,
	o.order_id


-- 39

select 
	c.customer_segment,
	p.category
from Customers as c
cross join Products as p


-- 40


select 
	e.employee_name,
	p.category
from Employees as e
cross join Products as p
order by
	e.employee_name desc,
	p.category asc

-- 41

select 
	p.category,
	count(distinct(c.customer_id)) as total_customer
from Customers as c
join Orders as o
on o.customer_id=c.customer_id
join Products as p
on p.product_id=o.product_id
group by
	p.category


--42


SELECT 
    p.category
FROM 
    Products p
join 
    Orders o ON p.product_id = o.product_id
GROUP BY 
    p.category
HAVING 
    COUNT(distinct o.customer_id) >= 5;

-- 43


SELECT 
    c.customer_id,
	c.customer_name
FROM 
    Products as p
join
    Orders as o ON p.product_id = o.product_id
join
	Customers as c on o.customer_id=c.customer_id
GROUP BY 
    c.customer_id,
	c.customer_name
HAVING 
    COUNT(DISTINCT p.product_id) >= 3;

-- 44

select 
	c.customer_segment,
	sum(o.quantity*p.unit_price) as total_value
from 
	Customers as c
join 
	Orders as o
on c.customer_id = o.customer_id
join Products as p
on p.product_id =o.product_id
where 
	o.order_status in ('Completed')
group by 
	c.customer_segment

-- 45

select 
	c.customer_segment,
	sum(o.quantity*p.unit_price) as total_value
from 
	Customers as c
join 
	Orders as o
on c.customer_id = o.customer_id
join Products as p
on p.product_id =o.product_id
where 
	o.order_status in ('Completed')
group by 
	c.customer_segment
having 
	sum(o.quantity*p.unit_price) > 50000


-- 46


select 
	e.employee_name,
	e.department,
	count(o.order_id) as total_order,
	sum(o.quantity) as total_quantity,
	sum(o.quantity*p.unit_price) as total_revenue,
	avg(o.quantity*p.unit_price) as avg_value
from 
	Employees as e
join Orders as o
on e.employee_id=o.sales_employee_id
join Products as p
on p.product_id =o.product_id
where 
	o.order_status in ('Completed')
group by 
	e.employee_name,
	e.department


-- 47


select top 1
	e.employee_name,
	sum(o.quantity*p.unit_price) as total_revenue
	
from 
	Employees as e
join Orders as o
on e.employee_id=o.sales_employee_id
join Products as p
on p.product_id =o.product_id
where 
	o.order_status in ('Completed')
group by 
	e.employee_name


-- 48


select distinct
	p.product_name,
	p.category,
	p.stock_quantity,
	coalesce(sum(o.quantity),0) as total_quantity_order,
	sum(case 
		when 
		o.order_status = 'Completed' 
		then 
		o.quantity * p.unit_price 
		else 
		0 
		end ) as total_revenue,
	count(distinct o.customer_id) as total_customer
	
from 
	Products as p
left join Orders as o
on p.product_id=o.product_id

group by 
	p.product_name,
	p.category,
	p.stock_quantity


-- 49

select 
	c1.customer_segment,
	c1.customer_name as customer_1,
	c1.total_revenue as total_revenue_1,
	c2.customer_name as customer_2,
	c2.total_revenue as total_revenue_2
from 
	
	( select 
		c.customer_id,
		c.customer_name,
		c.customer_segment,
		sum(o.quantity*p.unit_price) as total_revenue
	from 
		Customers as c
	join Orders as o
	on c.customer_id=o.customer_id
	join Products as p
	on p.product_id=o.product_id
	WHERE 
        o.order_status = 'Completed'
	group by
		c.customer_id,
		c.customer_name,
		c.customer_segment) as c1

		join 

		( select 
		c.customer_id,
		c.customer_name,
		c.customer_segment,
		sum(o.quantity*p.unit_price) as total_revenue
	from 
		Customers as c
	join Orders as o
	on c.customer_id=o.customer_id
	join Products as p
	on p.product_id=o.product_id
	WHERE 
        o.order_status = 'Completed'
	group by
		c.customer_id,
		c.customer_name,
		c.customer_segment) as c2

on 

	c1.customer_segment=c2.customer_segment

where
	c1.total_revenue > c2.total_revenue


-- 50


select 
		c.customer_segment,
		count(distinct c.customer_id) as nums_customer,
		count(distinct o.order_id) as completed_order,
		sum(o.quantity) as total_quanity_sold,
		sum(o.quantity*p.unit_price) as total_revenue,
		avg(o.quantity*p.unit_price) as avg_order_value

from 
		Customers as c
	join Orders as o
	on c.customer_id=o.customer_id
	join Products as p
	on p.product_id=o.product_id
where 
	o.order_status = 'Completed'
group by
	c.customer_segment



