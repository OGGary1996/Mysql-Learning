-- 如果需要经常频繁的使用某一个query，可以将其储存在stored procedures里，需要执行该query的时候通过命令直接执行
	-- eg.1 储存一个查询所有的客户信息的procedure
-- CREATE PROCEDURE SelectAllCustomers
-- AS
-- 	SELECT *
-- 	FROM customers
-- GO; 该语法用于SQL server

DELIMITER $$ -- 创建新的终止符号 防止被子query中的；干扰
CREATE PROCEDURE SelectAllCustomers()
BEGIN
	SELECT *
    FROM customers;
END $$
DELIMITER ; -- 还原终止符号
CALL SelectAllCustomers();
DROP PROCEDURE SelectAllCustomers IF EXISTS; -- 删除这个procedure

	-- eg.2 储存一个查询所有员工的分组平均工资的procedure
DELIMITER $$
CREATE PROCEDURE GroupAvaregeSalary()
BEGIN
	SELECT
		CASE 
			WHEN salary > 100000 THEN 'High'
			WHEN salary BETWEEN 50000 AND 100000 THEN 'Medium'
			ELSE 'Low'
		END AS salary_level,
		AVG(salary) AS average_salary
	FROM employees
	GROUP BY salary_level;
END $$
DELIMITER ;

CALL GroupAvaregeSalary; -- 执行这个procedure
DROP PROCEDURE GroupAvaregeSalary; -- 删除这个procedure


-- 可以给这个procedure插入变量 在call procedure时候赋值变量 
-- eg.1 
DELIMITER $$
CREATE PROCEDURE GroupAvaregeSalaryofOfficeID(IN office1 INT,IN office2 INT) -- 这里的IN表示输入参数 参数后需要填写类型
BEGIN
	SELECT 
		CASE
			WHEN salary > 100000 THEN 'High'
			WHEN salary BETWEEN 50000 AND 100000 THEN 'Medium'
			ELSE 'Low'
		END AS salary_level,
		AVG(salary)
	FROM employees
	WHERE office_id BETWEEN office1 AND office2
	GROUP BY salary_level;
END $$

CALL GroupAvaregeSalaryofOfficeID(1,3); -- 在调用procedure时传递参数