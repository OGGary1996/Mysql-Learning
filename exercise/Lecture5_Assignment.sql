create database solar_system;
use solar_system;

create table planet(
	planet_id int ,
    planet_name varchar(20) not null,
    primary key (planet_id)
);
insert into planet()
values 
	(1,'Mercury'),
    (2,'Venus'),
    (3,'Earth'),
    (4,'Mars'),
    (5,'Jupiter'),
    (6,'Saturn'),
    (7,'Uranus'),
    (8,'Neptune');
    
create table ring(
	planet_id int,
    ring_tot int not null,
    primary key (planet_id),
    foreign key (planet_id) references planet(planet_id)
);
insert into ring()
values
	(5,3),
    (6,7),
    (7,13),
    (8,6);

-- 5.1
select *
from planet p
join ring r on p.planet_id = r.planet_id;

-- 5.2
select *
from planet p
left join ring r on p.planet_id = r.planet_id;

-- 5.3
select *
from ring r
right join planet p on r.planet_id = p.planet_id;

-- 5.4
select
	p.planet_id,
    p.planet_name as Planets,
    r.ring_tot as Rings
from ring r
right join planet p using (planet_id);
