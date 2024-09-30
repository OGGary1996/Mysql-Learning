-- 通过foreign key的联系 可以同时join多个tables
select * 
from order_statuses os -- 逻辑上应该将orders表写在前面，因为orders表同时包含了customers表和order_statuses表中的column，但是并未强制要求，建议按照逻辑顺序来排列。
	join orders o on os.order_status_id = o.status
    join customers c on o.customer_id = c.customer_id; 

-- 按照逻辑顺序优化
select o.order_id,o.order_date,c.first_name,c.last_name,os.name as 'status'
from orders o
	join customers c on o.customer_id = c.customer_id
    join order_statuses os on o.status = os.order_status_id;

select p.payment_id,p.date,c.name,pm.name as paymentmethod
from payments p
	join clients c on c.client_id = p.client_id
    join payment_methods pm on pm.payment_method_id = p.payment_method;