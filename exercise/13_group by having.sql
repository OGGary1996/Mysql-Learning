USE sql_store;
-- GROUP BY 通常与聚合函数 count(),MAX(),MIN(),AVG(),一起使用实现分组的效果
SELECT 
	customer_id,
    COUNT(order_id) AS 'number of orders' -- 统计每个order_id的行数
FROM orders
GROUP BY customer_id; -- 按照每个customer_id来分组显示每个customer_id的order_id行数

SELECT 
		c.first_name AS 'Customers',
        COUNT(o.order_id) AS 'Total number of orders'
FROM orders o
JOIN customers c using (customer_id)
GROUP BY c.first_name;

-- HAVING 通常与GRPOUP BY搭配使用，可以对GROUP BY显示的结果进一步添加筛选，因为GROUP BY用于WHERE之后，不能再添加一个WHERE

SELECT 
	COUNT(order_id) AS 'Number of orders',
    status
FROM orders
GROUP BY status
HAVING status = 2; -- 添加查询结果的限制条件

SELECT 
	c.customer_id,
	c.first_name AS 'Customers',
    COUNT(o.order_id) AS 'Number of orders'
FROM orders o
JOIN customers c USING (customer_id)
GROUP BY c.customer_id 
HAVING COUNT(o.order_id) >= 2; 



