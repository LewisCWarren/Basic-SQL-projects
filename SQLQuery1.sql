use db_zoo



create table tbl_animalia (
	animalia_id int primary key not null identity (1,1),
	animalia_type varchar(50) not null
);


insert into tbl_animalia
    (animalia_type)
	values
	('vertebrate'),
	('invertebrate')
;



select * from tbl_animalia;


create table tbl_class (
	class_id int primary key not null identity (100,1),
	class_type varchar(50) not null
);

select * from tbl_class;

drop table tbl_class;

insert into tbl_class
	(class_type)
	values
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm')
;

update tbl_class set class_type = 'bird' where class_type = 'birds';

delete from tbl_class;

select replace(class_type, 'bird', 'birds') from tbl_class;

select upper(class_type) from tbl_class where class_type = 'bird'; 
	

create table tbl_order (
	order_id int primary key not null IDENTITY (1,1),
	order_type varchar(50) not NULL
);

create table tbl_care (
	care_id varchar(50) primary key not null,
	care_type varchar(50) not null,
	care_specialist int not NULL
);

create table tbl_nutrition (
	nutrition_id int primary key not null IDENTITY(2200,1),
	nutrition_type varchar(50) not null,
	nutrition_cost money not null
);

create table tbl_habitat (
	habitat_id int primary key not null IDENTITY(5000,1),
	habitat_type varchar(50) not null,
	habitat_cost money not null
);

create table tbl_specialist (
	specialist_id int primary key not null IDENTITY(1,1),
	specialist_fname varchar(50) not null,
	specialist_lname varchar(50) not null,
	specialist_contact varchar(50) not NULL
);

insert into tbl_order
	(order_type)
	values
	('carnivore'),
	('herbivore'),
	('omnivore')
;	

select * from tbl_order;

insert into tbl_care
(care_id, care_type, care_specialist)
	VALUES
	('care_0', 'replace the straw', 1),
	('care_1', 'repair or replace broken toys', 4),
	('care_2', 'bottle fee vitamins', 1),
	('care_3', 'human contact: pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to exercise pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;	

select * from tbl_care;

INSERT INTO tbl_nutrition
		(nutrition_type, nutrition_cost)
		VALUES 
		('raw fish', 1500),
		('living rodents', 600),
		('mixture of fruit and rice', 800),
		('warm bottle of milk', 600),
		('syringe feed with broth mixture', 600),
		('lard and seed mix', 300),
		('aphids', 150),
		('vitamins and marrow', 3500)
	;
	SELECT * FROM tbl_nutrition;


INSERT INTO tbl_habitat
		(habitat_type, habitat_cost)
		VALUES 
		('tundra', 40000),
		('grassy gnoll with trees', 12000),
		('10 ft pond and rocks', 30000),
		('icy aquirium with snowy facade', 50000),
		('short grass, shade, and moat', 50000),
		('netted forest atrium', 10000),
		('jungle vines and winding branches', 15000),
		('cliff with shaded cave', 15000)
	;
	SELECT * FROM tbl_habitat;


INSERT INTO tbl_specialist
		(specialist_fname, specialist_lname, specialist_contact)
		VALUES 
		('margret', 'nyguen', '384-576-2899'),
		('mary', 'fischer', '384-784-4856'),
		('arnold', 'holden', '385-475-3944'),
		('kem', 'byesan', '384-485-4855'),
		('delmonte', 'fyedo', '768-288-3749')
	;
	SELECT * FROM tbl_specialist;


create table tbl_species (
	species_id int primary key not null IDENTITY(1,1),
	species_name varchar(50) not null,
	species_animalia int not null CONSTRAINT fk_animalia_id foreign key REFERENCES tbl_animalia(animalia_id) on update cascade on delete cascade,
	species_class int not null CONSTRAINT fk_class_id foreign key REFERENCES tbl_class(class_id) on update CASCADE on delete cascade,
	species_order int not null CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) on update cascade on delete cascade,
	species_habitat int not null CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) on update CASCADE on DELETE cascade,
	species_nutrition int not null CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) on UPDATE CASCADE on DELETE CASCADE,
	species_care varchar(50) not null CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) on UPDATE CASCADE on DELETE CASCADE
	
);



INSERT INTO tbl_species
		(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
		VALUES 
		('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
		('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
		('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
		('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
		('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
		('panda', 1, 102, 3, 5006, 2202, 'care_4'),
		('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
		('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
	;
	SELECT * FROM tbl_species;

	drop table tbl_species;

	SELECT * FROM tbl_species where species_name = 'chicken';


	select

		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type,
		a5.habitat_type, a6.nutrition_type,
		a7.care_type

		from tbl_species a1
		inner join tbl_animalia a2 on a2.animalia_id = a1.species_animalia
		inner join tbl_class a3 on a3.class_id = a1.species class
		inner join tbl_order a4 on a4.order_id = a1.species_order
		inner join tbl_habitat a5 on a5.habitat_id = a1.species_habitat
		inner join tbl_nutrition a6 on a6.nutrion_id = a1.species_nutrition
		inner join tbl_care a7 on a7.care_id = a1.species_care
		where species_name = 'brown bear'
;