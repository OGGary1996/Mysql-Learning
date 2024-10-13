-- EXISTS 用于WHERE之后，如果EXISTS之后的subquery有至少一行record或查询到一个record，会马上停止subquery，EXISTS返回True，只要有subquery中有records，就会输出父query中的这个记录，并开始执行父query中的下一次查询
	/*  相比于IN，EXISTS更加高效，不关心subquery到底返回什么值，只关心是否存在records，
		example：用于查询customers中哪些customers在orders中有订单记录，不关心订单记录的具体信息 */
SELECT 
	customer_id,
    first_name AS 'costomers'
FROM customers c
WHERE EXISTS ( -- 创建一个subquery，并不关心这个subquery会返回什么具体的值，只要一旦有值，就立刻返回True。
	SELECT *
	FROM orders o
	WHERE c.customer_id = o.customer_id
    );
   
	-- example: 查询哪些products在order_items中，并且额外添加一个数量的限制条件
SELECT 
	p.product_id,
    name
FROM products P
WHERE EXISTS (
	SELECT *
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