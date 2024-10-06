-- 适用于快速拷贝一个table 作为archive
	-- 目标表格不存在 新建空表
create table orders_archive as
	select *
    from orders
    where order_date < '2019-01-01';
    -- 目标表格已经存在 直接导入目标表格 需要保证表格结构和数据类型一致
insert into orders_archive()
	select *
    from orders
    where order_date < '2019-01-01'; -- 整个select之后的语句可以被当作一整个子语句 直接放在后面执行
    

-- exercise 先join两个表格 再将这整个语句当作子语句块 用于copy表格。
create table invoices_archive as
	select 
		i.invoice_id,
		c.name,
		i.payment_date
	from invoices i
	join clients c on i.client_id = c.client_id
	join payments p on i.invoice_id = p.invoice_id; -- 本步骤筛选出了存在payment的invoice，
													-- 因为不需要合并显示payments表格中的内容，所以也可以不使用join来筛选，直接使用where也可

    