create database store;
use store;
create table city (
	city_name varchar(20),
    year int not null,
    high_temperature int not null,
    constraint check (high_temperature < 200),
    constraint check (year between 1880 and 2030),
    primary key (city_name,year)
    );
create table customer(
	customer_id int,
    customer_name varchar(20) not null,
    address varchar(50),
    primary key (customer_id)
    );
alter table customer 
add column customer_age int,
drop column address,
rename column customer_name to first_name,
rename to valued_customer;

alter table valued_customer
drop column customer_age,
add column last_name varchar(20),
add column zip_code int;

create table complaint(
	complaint_id int,
    complaint varchar(200) default "non_reason",
    customer_id int unique,
    primary key (complaint_id),
    foreign key (customer_id) references valued_customer(customer_id)
    );

insert into valued_customer (customer_id,first_name,last_name,zip_code)
	value
    (1,'ABC','DEF',400000),
    (2,'GHI','JKL',400000),
    (3,'MNO','PQR',400000);

select *
from valued_customer
where first_name = 'ABC';


create database land;
use land;
create table continent(
	continent_id int unique,
    continent_name varchar(20) unique,
    population bigint,
    primary key (continent_id)
);
alter table continent
rename column continent_id to land_id,
rename column continent_name to land_name,
rename to land_info;

alter table land_info
alter population set default null,
add constraint check_population check (population between 0 and 7000000000); 

insert into land_info(land_id,land_name,population)
value
	(1,'Asia',4600000000),
    (2,'Afica',null),
    (3,'Europe',750000000),
    (4,'North_America',600000000),
    (5,'South_America',430000000);

update land_info
set population = 1410000000
where land_id = 2;

insert into land_info(land_id,land_name)
value
	(6,'Oceania');

update land_info
set population = 43000000
where land_id = 6;

select * 
from land_info;

create table land1(
	land_name varchar(20),
    land_id int unique,
    main_country1 varchar(20) not null,
    main_country2 varchar(20) not null
);
alter table land1
add primary key(land_name),
add constraint fk foreign key (land_id) references land_info(land_id);
insert into land1(land_name,land_id,main_country1,main_country2)
value
	('Asia',1,'China','India');
    
create table land2(
land_name varchar(20),
land_id int unique,
main_country1 varchar(20) not null,
main_country2 varchar(20) not null,
primary key (land_name),
foreign key (land_id) references land_info (land_id)
);
insert into land2(land_name,land_id,main_country1,main_country2)
value
	('Africa',2,'Egypt','South_Africa');

