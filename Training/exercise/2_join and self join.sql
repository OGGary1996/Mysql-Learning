-- join同一个database中的不同tables的相同column
select *
from orders
	join customers on orders.customer_id = customers.customer_id;
    
select order_id,orders.customer_id,first_name,last_name
from orders
	join customers on orders.customer_id = customers.customer_id
where order_id between 5 and 10
order by order_id desc;

select order_id,oi.product_id,quantity,oi.unit_price
from order_items oi -- 定义简写table_name
	join products p on oi.product_id = p.product_id;

-- join跨越不同的database合并不同的tables中的column进行查询
select order_id,order_items.product_id,quantity,order_items.unit_price
from order_items 
	join sql_inventory.products on order_items.product_id = sql_inventory.products.product_id;
	-- 可以进行调换 未使用的database需要声明名称
select *
from sql_inventory.products ip
	join order_items oi on ip.product_id = oi.product_id;
    
-- join primary key and foreign key 组合键
select *
from order_items oi
	join order_item_notes oin 
		on oi.order_id = oin.order_id and oi.product_id = oin.product_id;


-- join同一个table中的不同的column slef_join
use sql_hr;
select *
from employees em
	join employees m on em.reports_to = m.employee_id; -- 查找员工的reports_to指向的一个员工的employee_id, 该员工是经理
    
select em.employee_id,em.first_name,m.first_name as manager
from employees em 
join employees m on em.reports_to = m.employee_id;