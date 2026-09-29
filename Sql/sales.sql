use sales_sql_task
go
--1

select * from sales

--2

select
	Order_ID,
	Order_Date,
	Customer_Name,
	Category,
	sales,
	Profit
from sales

--3

select
	sales
from sales	
where sales > 500.0

--4

select
	Product_Name,
	profit
from sales
where profit < 0

-- 5

select 
	Order_ID,
	Segment
from sales
where Segment='Consumer'

-- 6

select 
	Order_ID,
	Category
from sales
where Category='Technology'

--  7

select 
	Order_ID,
	Discount
from sales
where Discount> 0.20

-- 8

select 
	Order_ID,
	Ship_Mode
from sales
where Ship_Mode='first class'

-- 9

select 
	Order_ID,
	Region
from sales
where Region='west'

-- 10

select 
	Product_ID,
	Product_Name,
	Sub_Category
from sales
where Product_Name like '%chair%'


-- 11

select top 20
	Order_ID,
	sales
from sales
order by sales desc

-- 12

select top 20
	Order_ID,
	Profit
from sales
where profit > 0.0
order by Profit asc

--13

select distinct Category from sales;
select distinct Sub_Category from sales;
select distinct Segment from sales;
select distinct Region from sales;

--14

select 
	Product_ID,
	sales
from sales
order by sales desc

-- 15


select 
	Product_ID,
	sales
from sales
order by sales asc

--16

select 
	Customer_ID,
	Customer_Name 
from sales
order by Customer_Name asc

--17

select 
	Order_ID,
	Discount
from sales
order by Discount desc

--18

select	top 10
	Customer_Name,
	sales
from sales
order by sales desc

--19

select 
	round(sum(sales),2) as total_sale
from sales

--20

select 
	round(sum(Profit),2) as total_profit
from sales

--21

select 
	round(avg(sales),2) as avg_sale
from sales

--22

select 
	round(avg(Profit),2) as avg_profit
from sales

--23 min sale

select 
	round(min(sales),2) as min_sale
from sales

-- max sale

select 
	round(max(sales),2) as max_sale
from sales

-- 24 min proft

select 
	round(min(Profit),2) as min_profit
from sales

-- max profit

select 
	round(max(Profit),2) as max_profit
from sales

-- 25

select 
	count(*) as total_record
from sales

-- 26

select 
	count(distinct Customer_ID) as total_uniqe_customer
from sales

--27

select 
	count(distinct Product_ID) as total_uniqe_product
from sales


--28

select
	sum(Quantity) as total_quantity_sold
from sales

--29

select 
	category,
	round(sum(sales),2) as total_sale
from sales
group by Category


-- 30

select 
	category,
	round(sum(Profit),2) as total_profit
from sales
group by Category

--31

select 
	category,
	round(avg(sales),2) as total_avg_sale
from sales
group by Category

--32

select 
	Sub_Category,
	round(sum(sales),2) as total_sale
from sales
group by Sub_Category

--33

select 
	Sub_Category,
	round(sum(Profit),2) as total_profit
from sales
group by Sub_Category

--34

select 
	Region,
	round(sum(sales),2) as total_sale
from sales
group by Region

--35

select 
	Region,
	round(sum(Profit),2) as total_profit
from sales
group by Region

--36

select 
	Segment,
	round(sum(sales),2) as total_sale
from sales
group by Segment

--37

select 
	Category,
	sum(Quantity) as total_quantity
from sales
group by Category

--38

select 
	Ship_Mode,
	count(Order_ID) as total_order
from sales
group by Ship_Mode

--39

select 
	Segment,
	count(distinct Customer_ID) as total_customer
from sales
group by Segment

--40

select 
	State_Province,
	round(sum(sales),2) as total_sale
from sales
group by State_Province


-- 41

select 
	category,
	round(sum(sales),2) as total_sale
from sales
group by Category
having round(sum(sales),2) > 100000

--42

select 
	Sub_Category,
	round(sum(Profit),2) as total_profit
from sales
group by Sub_Category
having round(sum(Profit),2) > 10000

--43


select 
	Customer_Name,
	round(sum(sales),2) as total_sale
from sales
group by Customer_Name
having round(sum(sales),2) > 5000


--44

select 
	State_Province,
	round(sum(sales),2) as total_sale
from sales
group by State_Province
having round(sum(sales),2) > 50000

--45

select 
	Product_Name,
	round(sum(sales),2) as total_sale
from sales
group by Product_Name
having round(sum(sales),2) > 10000

--46

select 
	category,
	avg(discount) as avg_discount
from sales
group by category
having avg(discount) > 0.20

--47

select 
	Customer_Name,
	count(Order_ID) as total_order
from sales
group by Customer_Name
having count(Order_ID) > 5
order by Customer_Name asc

--48

select 
	Sub_Category,
	sum(Profit) as total_profit
from sales
group by Sub_Category
having sum(Profit) < 0

-- 49

select
	Order_id,
	Profit,
	case when Profit > 0 then 'Profitable' 
		 when Profit < 0 then 'Loss'
		 else 'Not profitable' end  as profit_status
from sales

--50

select
	Order_id,
	sales,
	case when sales < 100 then 'Low' 
		 when sales < 0 then 'Loss'
		 else 'Not profitable' end  as profit_status
from sales

--51

select
	Order_id,
	Discount,
	case when Discount <= 0.0 then 'No Discount' 
		 when Discount < 0.10 then 'Low'
		 when Discount < 0.30 then 'Medium'
		 else 'High' end  as Discount_status
from sales

--52

select
	category,
	sum(sales) as sale,
	case when sum(sales) > 50000 then 'High tier' 
		 when sum(sales) > 30000 then 'medium Tier'
		 else 'Low tier' end  as sale_status
from sales
group by category

--53


select
	*
from sales 
where Segment = 'Consumer' AND Region = 'West';

--54

select * 
from sales 
where Category = 'Technology' AND Sales > 1000;

--55


select
	*
from sales
where sales > 500 and Profit > 100 and Discount < 0.20

--56

select
	*
from sales
where Category='furniture' and Profit < 0.0

--57


select
	*
from sales
where Segment='corporate' and Category='technology'


--58



select
	*
from sales
where Region='east' and Discount > 0.30


--59

select
	min(Order_Date) as earliest_date
from sales

--60

select
	max(Order_Date) as letest_date
from sales

--61

select
	year(Order_Date) as Yearr ,
	sum(sales) as sale
from sales
group by 
	year(Order_Date)
order by
	sale desc

--62


select
	year(Order_Date) as Yearr ,
	sum(Profit) as profit
from sales
group by 
	year(Order_Date)
order by
	profit desc


--63


select
	month(Order_Date) as mon ,
	sum(sales) as sale
from sales
group by 
	month(Order_Date)
order by
	month(Order_Date) asc


--64

select
	year(Order_Date) as yearr ,
	count(distinct Order_ID) as tottal_ordr
from sales
group by 
	year(Order_Date)

--65


select
	year(Order_Date) as Yearr ,
	category,
	sum(sales) as sale
from sales
group by 
	year(Order_Date),
	category
order by
	category


--66

select
	year(Order_Date) as Yearr ,
	sum(sales) as sale
from sales
group by 
	year(Order_Date)
order by
	sale desc


--67


select
	month(Order_Date) as mon ,
	sum(sales) as sale
from sales
group by 
	month(Order_Date)
order by
	sale desc


--68

select
	Order_Date,
	Ship_Date,
	DATEDIFF(DAY,Order_Date,Ship_Date) as dayss
from sales
where DATEDIFF(DAY,Order_Date,Ship_Date) > 5


--69

select 
	product_name
from sales
where sales > 
	(
	select 
		avg(sales) as avg_sale
	from sales
	)

--70

select
	Customer_Name,
	sum(sales) as total_sale
from sales
group by Customer_Name
having sum(sales) > (
	select
		avg(sales) avg_sale
	from sales
)



