CREATE PROCEDURE `new_procedure` ()
BEGIN
	SELECT 
	CASE 
		WHEN salary > 100000 THEN 'High level'
		WHEN salary BETWEEN 50000 AND 10000 THEN 'Medium level'
		WHEN salary < 50000 THEN 'Low level'
	END AS salary_level,
	AVG(salary) AS Average_salary
	FROM employees
	GROUP BY salary_level;
END
