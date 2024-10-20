-- UNION结合结果集时会忽略两个查询中重复的值
-- UNION ALL则会返回所有的值，包括重复的值
select 
	order_id,
    order_date,
    'Active' as status -- 创建一个一次性显示的column
from orders
where order_date >= '2019-01-01'
union
select 
	order_id,
    order_date,
	'Archive' as status -- 创建一个一次性显示的column
from orders
where order_id < '2019-01-01';

select first_name
from customers
union 
select name 
from shippers; -- 返回的结果中 column name 通常情况下等于 第一个select中的column name

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