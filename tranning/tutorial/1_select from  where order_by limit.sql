use sql_store;
select * 
from customers;

-- SELECT DISTINCT * ,忽略重复项
SELECT DISTINCT state 
FROM customers;


-- select * from ...AS...
select customer_id,first_name,points,points * 1.1 AS "Rewards"
From customers;
	-- 如果points中可能有null，那么结果会返回null，可以使用 IFNULL(……,0)，意思是如果有null 则当作0来处理
SELECT 
	customer_id,
    first_name,
    points,
    IFNULL(points,0)
FROM customers;
-- 使用concat_wa()来合并一些column，创建一个新的临时的column用于显示结果
SELECT 
	customer_id,
    first_name AS 'Customer Name',
    CONCAT_WS(',',address,city,state) AS 'Location' -- WS的意思是with separator,所以第一个值需要输入分隔符
FROM customers;


-- where 中的逻辑运算
select customer_id,birth_date,first_name,state,points
from customers
where birth_date <= '1990-01-01' and state = 'VA' or points >= 1000;

select *
from order_items
where order_id = 6 and quantity * unit_price > 30;

select product_id,name,quantity_in_stock
from products
where quantity_in_stock in (49,38,72);

select *
from customers
where birth_date between '1990-01-01' and '2000-01-01';

select *
from customers 
where phone is null;

select *
from customers 
where phone is not null;

select * 
from orders
where shipped_date is null or 
	  shipper_id is null;


-- where中的模糊搜索
	-- like
select *
from customers
where last_name like '%b%'; -- 包含b

select *
from customers
where phone not like '%9'; -- 以9结尾

select *
from customers 
where address like '%trail%' or 
	  address like '%avenue%';  
      -- REGEXP
select * 
from customers
where first_name regexp 'ELKA|AMBUR'; -- first name are ELKA or AMBUR

select * 
from customers
where last_name regexp 'EY$|ON$'; -- last name end with EY or ON

select * 
from customers
where last_name regexp '^MY|SE'; -- last name start with MY or contains SE

select * 
from customers
where last_name regexp 'B[RU]'; -- last name contain B followed by R or U


-- order by排序      
select * ,quantity*unit_price as total_price
from order_items
where order_id = 2
order by total_price desc; -- 建立一个新的total——price column, 这是一个临时的column


-- limit限制搜索结果
select *
from customers
order by points desc
limit 3; -- 3 loyal customers

