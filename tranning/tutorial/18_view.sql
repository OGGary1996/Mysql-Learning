-- VIEW 是基于SELECT查询的一个虚拟表格，储存的是查询的逻辑而不是数据本身。可适用于长期使用某个查询。
-- SELECT 是一个一次性的查询语句，手动执行后立即返回结果，也不会保存数据。适用于临时一次性的查询。
	-- example1 生成一个VIEW来显示薪资大于平均薪资的员工
CREATE VIEW employees_above_average_salary AS
	SELECT *
	FROM employees
    WHERE salary > (
		SELECT AVG(salary)
        FROM employees
	);
    
	-- example2 显示每个部门的平均工资和最高最低工资
CREATE  VIEW employees_avg_min_max_salary AS
	SELECT 
		office_id,
		AVG(salary),
        MIN(salary),
        MAX(salary)
    FROM employees
    GROUP BY office_id;

-- 更新VIEW
CREATE OR REPLACE VIEW employees_above_average_salary AS
	SELECT *
    FROM employees
    WHERE salary > (
		SELECT AVG(salary)
        FROM employees
	) AND office_id IN (1,2,3,4,5);

CREATE OR REPLACE VIEW employees_avg_min_max_salary AS
	SELECT 
		office_id,
        AVG(salary),
        MIN(salary),
        MAX(salary)
    FROM employees
    WHERE office_id IN (1,2,3,4,5)
    GROUP BY office_id;


-- 删除VIEW
DROP VIEW employees_above_average_salary;
