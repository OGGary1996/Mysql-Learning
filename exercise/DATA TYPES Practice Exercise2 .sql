create database datatypes;
use datatypes;
create table Eclipse(
	Eclipse_Date date not null,
    Time_of_greatest_eclipse time not null,
    Eclipse_type varchar(20) not null,
    Magnitude decimal,
    primary key (Eclipse_Date,Time_of_greatest_eclipse)
);
alter table Eclipse modify column Magnitude decimal(4,3);

insert into Eclipse
value
('2022-04-30','22:42:36','partial',0.640),
('2022-10-25','11:01:20','partial',0.862),
('2023-04-20','04:17:56','hybrid',1.013);
select * from Eclipse
order by Eclipse_Date;

create table Planet_distance(
	planet varchar(20),
    miles_from_erth bigint unique,
    diameter_km int unique,
    primary key (planet)
);
insert into Planet_distance
value
('Mars' , 48678219 , 6279 ),
('Jupiter' , 390674712 , 142984 ),
('Saturn' , 792248279 , 120536),
('Uranus' , 1692662533 , 51118),
('Neptune' , 2703959966 , 49528 );

select * from Planet_distance
order by miles_from_erth;