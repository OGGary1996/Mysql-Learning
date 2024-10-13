select *
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name as shipper
from customers c
left join orders o using (customer_id) -- on c.customer_id = o.customer_id
left join shippers sh using (shipper_id) -- on o.shipper_id = sh.shipper_id
order by c.customer_id;

select 
	o.order_date,
    o.order_id,
    c.first_name,
    sh.name as shipper,
    os.name as status
from orders o
join customers c using (customer_id) -- on o.customer_id = c.customer_id
left join shippers sh using (shipper_id) -- on o.shipper_id = sh.shipper_id
join order_statuses os on o.status = os.order_status_id; -- 两个table中的column name不相同 不能使用using

select *
	p.date,
    c.name,
    p.amount,
    pm.name
from payments p
join clients c using (client_id)
join payment_methods pm on p.payment_method = pm.payment_method_id; 