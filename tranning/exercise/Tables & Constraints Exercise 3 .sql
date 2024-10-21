create database pet_information;
use pet_information;

create table owner (
owner_id int,
owner_name varchar(20) not null,
owner_address varchar(50) not null,
primary key (owner_id)
);
insert into owner(owner_id,owner_name,owner_address)
	value
	(1, 'John', '123 Maple St'),
    (2, 'Jane', '456 Oak St'),
    (3, 'Michael', '789 Pine Ave'),
    (4, 'Emily', '321 Cedar Dr'),
    (5, 'William', '654 Birch Ln'),
    (6, 'Sophia', '987 Walnut St'); 

create table breed (
	breed_id int,
    breed_name varchar(20) default 'not_sure',
    temperament varchar(50) default 'not_sure',
    primary key (breed_id)
    );
    insert into breed(breed_id,breed_name,temperament)
    value
    (1, 'Labrador','friendly'),
    (2, 'German','smart'),
    (3, 'Golden Retriever'),
    (4,default,'calm'),
    (5, 'Beagle'),
    (6, 'Poodle');
    
create table veterinarian(
	veterinarian_id int,
    veterinarian_name varchar(20),
    veterinarian_address varchar(50),
    veterinarian_phone int unique,
    primary key (veterinarian_id)
    );
    insert into veterinarian(veterinarian_id,veterinarian_name,veterinarian_address,veterinarian_phone)
    value
	(1, 'Dr. Emily', '123 Forest Ave', 1234567),
    (2, 'Dr. John', '456 Oak St', 2345678),
    (3, 'Dr. Olivia', '789 Pine Rd', 3456789),
    (4, 'Dr. James', '321 Cedar Dr', 4567890),
    (5, 'Dr. Sophia', '654 Birch Ln', 5678901),
    (6, 'Dr. Michael', '987 Walnut St', 6789012);

create table dog(
dog_id int,
dog_name varchar(20) not null,
owner_id int unique,
breed_id int unique,
veterinarian_id int unique,
primary key (dog_id),
foreign key (owner_id) references owner(owner_id),
foreign key (breed_id) references breed(breed_id),
foreign key (veterinarian_id) references veterinarian(veterinarian_id)
);
insert into dog(dog_id,dog_name,owner_id,breed_id,veterinarian_id)
value 
    (1, 'Lucy', 5, 4, 4),
    (2, 'Max', 2, 6, 2),
    (3, 'Bella', 6, 1, 3),
    (4, 'Charlie', 4, 3, 6),
    (5, 'Buddy', 1, 5, 5),
    (6, 'Molly', 3, 2, 1);

select * from dog
order by dog_id;

select * from owner
order by owner_id;

select * from breed
order by breed_id;

select * from veterinarian
order by veterinarian_id;
