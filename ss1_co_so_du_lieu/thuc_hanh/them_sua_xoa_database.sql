-- create schema ss1_thuc_hanh; 
-- create database ss1_database;
-- drop database ss1_database;
-- create table ss1_thuc_hanh.class(`id` int not null,`name` varchar(45) not null,primary key(`id`));
-- create table ss1_thuc_hanh.student(`id` int not null,`name` varchar(45) not null,`age` int null,`country` varchar(45) ,primary key(`id`));
-- insert into ss1_thuc_hanh.student (id,name,age,country) values (1,'Nguyen Quang Huu',29,'Da Nang');
-- insert into ss1_thuc_hanh.student (id,name,age,country) values (2,'Nguyen Quang Huu',29,'Da Nang');
-- insert into ss1_thuc_hanh.student (id,name,age,country) values (3,'Nguyen Quang Huu',29,'Da Nang');

-- select id,name,age,country from ss1_thuc_hanh.student;

-- update ss1_thuc_hanh.student set name='Nguyen Thi Kim Yen' where id = 2;
-- update ss1_thuc_hanh.student set name='Nguyen Thi My Duyen' where id = 3;


-- insert into ss1_thuc_hanh.student (id,name,age,country) values (4,'Test ',18,'Nuoc Ngoai');
-- insert into ss1_thuc_hanh.student (id,name,age,country) values (5,'Test 1',20,'Nuoc Ngoai');
-- select id,name,age,country from ss1_thuc_hanh.student;
-- DELETE FROM ss1_thuc_hanh.student WHERE name='Test';
-- select id,name,age,country from ss1_thuc_hanh.student;
