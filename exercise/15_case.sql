-- 用于不同的条件来显示不同的值，并且可以添加这个列
	-- 基于不同的薪资水平来显示评价
SELECT 
	employee_id,
    first_name AS 'name',
    salary,
CASE
	WHEN salary > 100000 THEN 'high level'
	WHEN salary BETWEEN 50000 AND 100000 THEN 'medium level'
    ELSE 'low level'
END AS 'salary level'
FROM employees;

	-- 用于分组计算
SELECT 
CASE 
	WHEN salary > 100000 THEN 'High level'
    WHEN salary BETWEEN 50000 AND 10000 THEN 'Medium level'
    WHEN salary < 50000 THEN 'Low level'
END AS salary_level,
AVG(salary) AS Average_salary
FROM employees
GROUP BY salary_level;

-- 用于在ORDER BY之后来进行自定义排序alter
USE sql_store;
SELECT 
	customer_id,
    first_name AS Customers,
	city,
    state
FROM customers
ORDER BY 
(CASE
	WHEN city IS NULL THEN state
    ELSE city
END);