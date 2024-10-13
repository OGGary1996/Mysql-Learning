-- insert 多个row
	-- 如果table中的primary key带有auto_increment 则可以不用输入那个primary key
insert into shippers(name)
values
	('shipper1'),
    ('shipper2'),
    ('shipper3'); 
    
-- insert hierarchical row
insert into orders(customer_id,order_date,status)
values
	(1,'2019-01-05',1);

insert into order_items()
values
	(last_insert_id(),1,1,2.96), -- last_insert_id(), 是一个内建函数，可以在不用查看table的前提下 直接替换输入最近一次添加进table的那个id
    (last_insert_id(),2,3,1.65);