-- show all data


select * from sales

-- total sale

select 
	round(sum(sales),2) as total_sale
from sales

-- total profit

select 
	round(sum(Profit),2) as total_profit
from sales


-- total quantity

select 
	sum(Quantity) as total_quantity
from sales

-- total discount


select 
	round(sum(Discount),2) as total_discount
from sales


-- avg_sale

select 
	round(avg(sales),2) as avg_sale
from sales


-- avg profit

select 
	round(avg(Profit),2) as avg_profit
from sales


-- avg quantity

select 
	avg(Quantity) as avg_quantity_sold
from sales

-- avg discount

select 
	round(avg(Discount),2) as avg_discount
from sales

-- min sale

select 
	round(min(sales),2) as min_sale
from sales

-- max sale

select 
	round(max(sales),2) as max_sale
from sales

-- count

select 
count(distinct Customer_ID) as total_customer
from sales

-- time taken by orderdate to ship date

select
	order_date,
	ship_date,
	DATEDIFF(DAY,Order_Date,Ship_Date) AS Days
from sales



-- counrty wise total sale
select 
	country_region,
	round(sum(sales),2) as total_sale
from sales
group by
country_region

-- region-wise -- top product sale with subquery

select  
		region,
		product_name,
		total_sale
	from  
	(
	select
		region,
		product_name,
		sum(sales) over(partition by product_name order by sales desc) as total_sale,
		rank() OVER(partition by region order by sales desc) as ranked
	from sales
) tt 
where ranked = 1

-- with CTE

with tt as (
select
		region,
		product_name,
		sum(sales) over(partition by product_name order by sales desc) as total_sale,
		rank() OVER(partition by region order by sales desc) as ranked
	from sales
	)
	select
		region,
		product_name,
		total_sale
		from tt where ranked =1



select
		product_name,
		total_sale,
		ranked
	from  
	(
	select
		
		product_name,
		sum(sales) over(partition by product_name order by sales desc) as total_sale,
		dense_rank() OVER(partition by product_name order by sales desc) as ranked
	from sales
) tt 
where ranked < 6





















