USE sql_store;
-- 聚合函数 MIN(),MAX(),AVG(),COUNT(),SUM()
SELECT COUNT(DISTINCT customer_id) AS "number of ordered customers" -- 统计结果忽略了重复项目
FROM orders;

SELECT *
FROM products
WHERE unit_price > ( -- 查询商品价格超过平均值的商品信息
	SELECT AVG(unit_price) 
    FROM products
);

	-- 聚合函数中也支持使用逻辑运算
SELECT 
	SUM(quantity_in_stock * unit_price) -- 所有库存商品的总价值
FROM products;

-- GROUP BY 通常与聚合函数 count(),MAX(),MIN(),AVG(),一起使用实现分组的效果
SELECT 
	customer_id,
    COUNT(order_id) AS 'number of orders' -- 统计每个order_id的行数
FROM orders
GROUP BY customer_id; -- 按照每个customer_id来分组显示每个customer_id的order_id行数

SELECT 
	p.product_id,
	SUM(oi.quantity) AS "Total quantity of ordered", -- 商品的订单销售量
    SUM(p.quantity_in_stock) AS "Total quantity in stock" -- 商品的库存量
FROM order_items oi
JOIN products p USING (product_id)
GROUP BY p.product_id;

SELECT 
	name AS products,
	SUM(quantity_in_stock * unit_price) AS "Total price"-- 库存商品总价格
FROM products
GROUP BY name;

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

SELECT 
	p.product_id,
	SUM(oi.quantity) AS "Total quantity of ordered", -- 商品的订单销售量
    SUM(p.quantity_in_stock) AS "Total quantity in stock" -- 商品的库存量
FROM order_items oi
JOIN products p USING (product_id)
GROUP BY p.product_id
HAVING SUM(oi.quantity) >= SUM(p.quantity_in_stock); -- 销售数量超过库存数量的情况

