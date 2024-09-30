-- 在之前的例子中 sql_hr的员工列表中查询出每个员工的上级
select 
	e.employee_id,
    e.first_name,
    m.first_name as manager
from employees e 
join employees m on e.reports_to = m.employee_id; -- 只显示了有reports_to的员工 没有显示出manager

select 
	e.employee_id,
    e.first_name,
    m.first_name as manager
from employees e 
left join employees m on e.reports_to = m.employee_id;