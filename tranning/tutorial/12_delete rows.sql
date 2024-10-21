delete from invoices
where client_id =  -- 也可以直接使用代码块
	(select client_id
    from clients
    where name = 'Myworks');