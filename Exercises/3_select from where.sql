use store;
select *
from valued_customer
where first_name = 'ABC';

create database employment;
use employment;
create table unemloyed (
	region_id int unique,
    num_umemployed int,
    primary key (region_id)
);

alter table unemloyed
	rename to unemployed;
    
alter table unemployed
	rename column num_umemployed to num_unemployed;

insert into unemployed (region_id,num_unemployed)
value
	(1,2218457),
    (2,137455),
    (3,null);
select * 
from unemployed
where num_unemployed is null;