create database bookstoredb;
use bookstoredb;
create table books (
	Book_id 			int unique,
	Title 				varchar(50) unique,
    Author_id 			int not null,
    Price 				int not null,
    Publication_Year 	year not null,
    constraint check (Price >= 0),
    primary key (Book_id)
    );
    alter table books
		add unique (Author_id);
create table authors( 
	Author_id			int unique,
    First_Name			varchar(20),
    Last_Name			varchar(20),
    primary key (Author_id),
    constraint foreign key (Author_id) references books(Author_id)
    );
create table orders (
	Order_id 			int unique,
    Customer_Name		varchar(20),
    Order_Date			datetime,
    primary key (Order_id)
    );
    
insert into books
value 
	(1, 'HONGLOUMENG', 1, 59, 1920),
	(2, 'SANGUOYANYI', 2, 45, 1930),
	(3, 'XIYOUJI', 3, 50, 1945),
	(4, 'SHUIHUZHUAN', 4, 55, 1937),
	(5, 'ZHAOHUAXISHI', 5, 35, 1928);

insert into authors
value
	(1, 'Xue_qin', 'Cao'),
	(2, 'Guan_zhong', 'Luo'),
	(3, 'Cheng_en', 'Wu'),
	(4, 'Nai_an', 'Shi'),
	(5, 'Xun', 'Lu');
    
insert into orders
value 
	(1, 'Zhang San', '2024-09-23 14:30:00'),
	(2, null, '2024-09-23 15:45:00'),
	(3, 'Wang Wu', null);
    
alter table authors
    rename column Author_id to Writers_id,
	rename to writers;
alter table books
	rename column Author_id to Writers_id;
alter table books
	add column ISBN varchar(13),
    drop column Price;

select *
from books
where Publication_Year > 1935; -- sorry, I just fund that the books I insert were all published before 2000.

select * 
from orders
where Order_Date is null;

select *
from writers 
where First_Name = 'Xun';  -- sorry, I just fund that the authors I insert were all Chinses.

select *
from books
order by Title;

select *
from books
order by Publication_Year desc;

select *
from writers
order by Last_Name desc;

drop table orders;







