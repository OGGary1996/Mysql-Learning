-- update单个row
update invoices
set payment_total = 10 , payment_date = '2019-03-02'
where invoice_id = 1;

update invoices
set payment_total = default , payment_date = default
where invoice_id = 1;

update invoices
set payment_total = invoice_total * 0.5, -- 可在其中做数学运算
	payment_date = due_date
where invoice_id = 3;

-- update多个rows
update invoices
set payment_total = invoice_total * 0.5, -- 可在其中做数学运算
	payment_date = due_date
where client_id = 3;

update invoices
set payment_total = invoice_total * 0.5, 
	payment_date = due_date
where invoice_id in (8,9,10); -- 可以一次更新多行

update customers
set points = points + 50
where birth_date < '1990-01-01'; -- 可以一次更新多行

-- 使用代码块
update invoices
set payment_total = invoice_total * 0.8, 
	payment_date = due_date
where client_id = -- 如果后面的代码块返回的是一个结果，可以直接使用等号 =
	(select client_id  -- 适用于无法直接获取到client_id的情况 可以使用select先查询，再将其当作一整个代码块直接使用
	from clients
	where name = 'Myworks' );

update invoices
set payment_total = invoice_total * 0.8, 
	payment_date = due_date
where client_id in -- 如果后面的代码块返回的是好几个结果，如来自于2个states的顾客不止一个人， 则需要使用 in
	(select client_id 
	from clients 
	where state in ('CA','NY')); -- 适用于更新所有来自于CA和NY两个state的顾客的数据，但是无法直接获取到这两个state顾客的client_id


-- exercise 更新orders表格中的comments，如果顾客的point达到3000以上
update orders
set comments = 'Gold customers'
where customer_id in 
	(select customer_id 
    from customers
    where points >= 3000);

