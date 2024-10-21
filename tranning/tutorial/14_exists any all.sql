-- EXISTS 用于WHERE之后，将父查询之中的结果代入EXISTS中进行判断，如果子查询中至少存在一条匹配的条件则返回True，则输出当前父查询中的这个row，然后开始进行下一次查询
-- 在 EXISTS 中，子查询不会单独执行，它会依赖于父查询中的某些值进行计算，每次都根据父查询的当前行动态地评估子查询的结果。
-- 这种“代入”过程实际上是将父查询中的某个值带入到子查询中，子查询会根据这些值做出判断，返回 True 或 False，从而决定是否返回父查询中的这行数据。

	/*  相比于IN，EXISTS更加高效，不关心subquery到底返回什么值，只关心是否存在records，
		example：用于查询customers中哪些customers在orders中有订单记录，不关心订单记录的具体信息 */
SELECT 
	customer_id,
    first_name AS 'costomers'
FROM customers c
WHERE EXISTS ( -- 创建一个subquery，并不关心这个subquery会返回什么具体的值，只要一旦有值，就立刻返回True。
	SELECT 1 -- 因为不关心子查询具体的结果 只判断是否条件匹配 所以可以直接选择输入1
	FROM orders o
	WHERE c.customer_id = o.customer_id
    );

	-- example: 查询哪些products在order_items中，并且额外添加一个数量的限制条件
SELECT 
	p.product_id,
    name
FROM products P
WHERE EXISTS (
	SELECT 1
    FROM order_items oi 
    WHERE p.product_id = oi.product_id AND quantity > 5
);


-- ANY 和 ALL
	/*  同样用于WHERE之后，用于比较查询结果和subquery中的查询条件之间的关系 
		ANY 用于当前次父query中的查询结果满足subquery中任意一条能match上 就会返回True，这个父query中的当次结果会被选中并输出，
		ALL 用于当前次父query中的查询结果满足subquery中所有的结果，则会返回True，这个父query中的当次结果会被选中并输出，
		example：找出所有 薪水大于office_id = 1中的员工薪水的员工 */
USE sql_hr;
SELECT 	
	employee_id,
    first_name AS 'Name'
FROM employees
WHERE salary > ALL (
	SELECT salary
    FROM employees
    WHERE office_id = 1
);