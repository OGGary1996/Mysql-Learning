-- outer join 
-- 可以将一侧表中的所有信息列出 即使在另一侧表中并未一一匹配上该行信息
select *
from customers c
	join orders o on c.customer_id = o.customer_id; -- 只会列出在orders里有记录的customers

select 
	c.customer_id,
    c.first_name,
    o.order_id
from customers c
	left join orders o on c.customer_id = o.customer_id ; -- 列出了所有的customers，即使在orders中没有对应信息

select 
	p.product_id,
    p.name,
    oi.quantity
from products p
	left join order_items oi on p.product_id = oi.product_id;
