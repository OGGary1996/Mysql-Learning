-- 使用left join查询多个表
-- join和left join没有优先级，按照先后顺序执行

select 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name as shipper
from customers c
	left join orders o on c.customer_id = o.customer_id -- 包含所有的orders信息的customers信息
    join shippers sh on o.shipper_id = sh.shipper_id -- 在以上条件下 再过滤掉没有跟orders匹配的shippers信息
    order by c.customer_id;
    
select 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name as shipper
from customers c
	join orders o on c.customer_id = o.customer_id -- 过滤没有与orders匹配的customers信息
    left join shippers sh on o.shipper_id = sh.shipper_id -- 再以上条件下 再添加包含了所有orders信息的shippers信息
	order by c.customer_id;
        
select 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name as shipper
from customers c
left join orders o on c.customer_id = o.customer_id
left join shippers sh on o.shipper_id = sh.shipper_id
order by c.customer_id;

select 
	o.order_date,
    o.order_id,
    c.first_name,
    sh.name as shipper,
    os.name as status
from orders o
join customers c on o.customer_id = c.customer_id
left join shippers sh on o.shipper_id = sh.shipper_id
join order_statuses os on o.status = os.order_status_id;
