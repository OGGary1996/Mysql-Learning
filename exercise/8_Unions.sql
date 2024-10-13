select 
	order_id,
    order_date,
    'Active' as status
from orders
where order_date >= '2019-01-01'
union
select 
	order_id,
    order_date,
	'Archive' as status
from orders
where order_id < '2019-01-01';

select first_name
from customers
union 
select name 
from shippers; -- 返回的结果中column name = 第一个select

select 
	customer_id,
    first_name,
    points,
    'Bronze' as Type
from customers
where points < 2000
union
select
	customer_id,
    first_name,
    points,
    'Silver'
from customers
where points between 2000 and 3000
union
select 
	customer_id,
    first_name,
    points,
    'Gold'
from customers
where points > 3000
order by first_name;