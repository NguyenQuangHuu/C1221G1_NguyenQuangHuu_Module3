drop database if exists case_study;
create database case_study;
use case_study;

create table customer_type(
customer_type_code int not null auto_increment primary key,
customer_type_name varchar(45) not null
);
create table customers(
customer_id int not null auto_increment primary key,
customer_code varchar(10),
customer_name varchar(45) not null,
customer_dob date,
customer_gender bit default 1 not null,
customer_passport_id varchar(45) not null,
customer_phone_number varchar(45),
customer_email varchar(45),
customer_address varchar(45),
customer_type_code int not null,
foreign key (customer_type_code) references customer_type(customer_type_code)
);


create table rent_type(
rent_type_code int not null auto_increment primary key,
rent_type_name varchar(45) not null
);

create table service_type(
service_type_code int not null auto_increment primary key,
service_type_name varchar(45) not null
);

create table services(
service_id int not null auto_increment primary key,
service_code varchar(10),
service_name varchar(45) not null,
service_usable_area double ,
service_rent_fee double ,
service_maximum_capacity int,
rent_type_code int,
service_type_code int,
service_room_type varchar(45) null,
service_advance varchar(45) ,
service_swimming_pool_area double null,
service_floor int null,
foreign key (service_type_code) references service_type(service_type_code),
foreign key (rent_type_code) references rent_type(rent_type_code)
);

create table positions(
position_code int not null auto_increment primary key,
position_name varchar(45) not null
);
create table levels(
level_code int not null auto_increment primary key,
level_name varchar(45) not null
);

create table departments(
department_code int not null auto_increment primary key,
department_name varchar(45) not null
);

-- create table `user`(
-- 	username varchar(255) primary key not null,
--     `password` varchar(255) not null
--     
-- );

-- create table `role`(
-- 	role_id int primary key auto_increment,
--     role_name varchar(255) not null
-- );

-- create table user_role(
-- 	role_id int,
--     username varchar(255),
--     foreign key (role_id) references `role`(role_id),
--     foreign key (username) references `user`(username)
-- );

create table employees(
employee_code int not null auto_increment primary key,
employee_name varchar(45) not null,
employee_dob date,
employee_gender bit default 1 not null,
employee_passport_id varchar(45) not null,
employee_salary double not null check( employee_salary > 0 ),
employee_phone_number varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_code int not null,
level_code int not null,
department_code int not null,
-- username varchar(255),
-- foreign key (username) references `user`(username),
foreign key (position_code) references positions(position_code),
foreign key (level_code) references levels(level_code),
foreign key (department_code) references departments(department_code)
);

create table contracts(
contract_code int not null auto_increment primary key,
contract_start_date date not null,
contract_end_date date not null,
contract_deposit double not null,
employee_code int not null,
customer_id int not null,
service_id int not null,
foreign key (employee_code) references employees(employee_code),
foreign key (customer_id) references customers(customer_id),
foreign key (service_id) references services(service_id)
);
create table advance_services(
advance_service_code int not null auto_increment primary key,
advance_service_name varchar(45) not null,
advance_service_price double not null,
advance_service_status varchar(100) not null,
advance_service_quantity varchar(45)
);
create table contract_details(
contract_detail_code int not null auto_increment primary key,
contract_code int not null,
advance_service_code int not null,
contract_detail_quantity int default 1,
foreign key (contract_code) references contracts(contract_code),
foreign key (advance_service_code) references advance_services(advance_service_code)
);


INSERT INTO `case_study`.`positions` (`position_code`, `position_name`) VALUES ('1', 'Qu???n L??');
INSERT INTO `case_study`.`positions` (`position_code`, `position_name`) VALUES ('2', 'Nh??n Vi??n');


INSERT INTO `case_study`.`levels` (`level_code`, `level_name`) VALUES ('1', 'Trung C???p');
INSERT INTO `case_study`.`levels` (`level_code`, `level_name`) VALUES ('2', 'Cao ?????ng');
INSERT INTO `case_study`.`levels` (`level_code`, `level_name`) VALUES ('3', '?????i H???c');
INSERT INTO `case_study`.`levels` (`level_code`, `level_name`) VALUES ('4', 'Sau ?????i H???c');


INSERT INTO `case_study`.`departments` (`department_name`) VALUES ('Sale-Marketing');
INSERT INTO `case_study`.`departments` (`department_name`) VALUES ('H??nh ch??nh');
INSERT INTO `case_study`.`departments` (`department_name`) VALUES ('Ph???c v???');
INSERT INTO `case_study`.`departments` (`department_name`) VALUES ('Qu???n l??');



INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (1, 'Nguy???n V??n An', '1970-11-07', 1,'456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguy???n T???t Th??nh, ???? N???ng', 1, 3, 1);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (2, 'L?? V??n B??nh', '1997-04-09', 1, '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Y??n B??i, ???? N???ng', 1, 2, 2);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (3, 'H??? Th??? Y???n', '1995-12-12', 1, '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 ??i???n Bi??n Ph???, Gia Lai', 1, 3, 2);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (4, 'V?? C??ng To???n', '1980-04-04', 1, '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Ho??ng Di???u, Qu???ng Tr???', 1, 4, 4);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (5, 'Nguy???n B???nh Ph??t', '1999-12-09', 1, '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng', 2, 1, 1);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (6, 'Kh??c Nguy???n An Nghi', '2000-11-08', 1, '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguy???n T???t Th??nh, ???? N???ng', 2, 2, 3);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (7, 'Nguy???n H???u H??', '1993-01-01', 1, '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguy???n Ch?? Thanh, Hu???', 2, 3, 2);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (8, 'Nguy???n H?? ????ng', '1989-09-03', 1, '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 H??ng V????ng, H?? N???i', 2, 4, 4);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (9, 'T??ng Hoang', '1982-09-03', 1, '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 H??m Nghi, ???? N???ng', 2, 4, 4);
INSERT INTO `case_study`.`employees` (`employee_code`, `employee_name`, `employee_dob`, `employee_gender`, `employee_passport_id`, `employee_salary`, `employee_phone_number`, `employee_email`, `employee_address`, `position_code`, `level_code`, `department_code`) VALUES (10, 'Nguy???n C??ng ?????o', '1994-01-08', 1, '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Ho?? Kh??nh, ?????ng Nai', 2, 3, 2);


INSERT INTO `case_study`.`customer_type` (`customer_type_name`) VALUES ('Diamond');
INSERT INTO `case_study`.`customer_type` (`customer_type_name`) VALUES ('Platinium');
INSERT INTO `case_study`.`customer_type` (`customer_type_name`) VALUES ('Gold');
INSERT INTO `case_study`.`customer_type` (`customer_type_name`) VALUES ('Silver');
INSERT INTO `case_study`.`customer_type` (`customer_type_name`) VALUES ('Member');

use case_study;
insert into customers(customer_code,customer_name,customer_dob,customer_gender,customer_passport_id,customer_phone_number,customer_email,customer_address,customer_type_code)
values ("KH-0001","Nguy???n Th??? H??o","1970-11-07",0,"643431213","0945423362","thihao07@gmail.com","23 Nguy???n Ho??ng,???? N???ng",5),
("KH-0002","Ph???m Xu??n Di???u","1992-08-08",1,"865342123","0954333333","xuandieu92@gmail.com","K77/22 Th??i Phi??n, Qu???ng Tr???",3),
("KH-0003","Tr????ng ????nh Ngh???","1990-02-27",1,"488645199","0373213122","nghenhan2702@gmail.com","K323/12 ??ng ??ch Khi??m, Vinh",1),
("KH-0004","D????ng V??n Quan","1981-07-08",1,"543432111","0490039241","duongquan@gmail.com","K453/12 L?? L???i, ???? N???ng",1),
("KH-0005","Ho??ng Tr???n Nhi Nhi","1995-12-09",0,"795453345","0312345678","nhinhi123@gmail.com","224 L?? Th??i T???, Gia Lai",4),
("KH-0006","T??n N??? M???c Ch??u","2005-12-06",0,"732434215","0988888844","tonnuchau@gmail.com","37 Y??n Th???, ???? N???ng",4),
("KH-0007","Nguy???n M??? Kim","1984-04-08",0,"856453123","0912345698","kimcuong84@gmail.com","K123/45 L?? L???i, H??? Ch?? Minh",1),
("KH-0008","Nguy???n Th??? H??o","1999-04-08",0,"965656433","0763212345","haohao99@gmail.com","55 Nguy???n V??n Linh, Kon Tum",3),
("KH-0009","Tr???n ?????i Danh","1994-07-01",1,"432341235","0643343433","danhhai99@gmail.com","24 L?? Th?????ng Ki???t, Qu???ng Ng??i",1),
("KH-0010","Nguy???n T??m ?????c","1989-07-01",1,"344343432","0987654321","tdactam@gmail.com","22 Ng?? Quy???n, ???? N???ng",2);

INSERT INTO `case_study`.`rent_type` (`rent_type_name`) VALUES ('year');
INSERT INTO `case_study`.`rent_type` (`rent_type_name`) VALUES ('month');
INSERT INTO `case_study`.`rent_type` (`rent_type_name`) VALUES ('day');
INSERT INTO `case_study`.`rent_type` (`rent_type_name`) VALUES ('hour');

INSERT INTO `case_study`.`service_type` (`service_type_name`) VALUES ('Villa');
INSERT INTO `case_study`.`service_type` (`service_type_name`) VALUES ('House');
INSERT INTO `case_study`.`service_type` (`service_type_name`) VALUES ('Room');

INSERT INTO `case_study`.`services` (`service_code`,`service_name`, `service_usable_area`, `service_rent_fee`, service_maximum_capacity, `rent_type_code`, `service_type_code`, `service_room_type`, `service_advance`, `service_swimming_pool_area`, `service_floor`) VALUES 
('DV-0001','Villa Beach Front', 25000, '10000000', 10, 3, 1, 'vip', 'C?? h??? b??i', 500, 4),
('DV-0002','House Princess 01', 14000, '5000000', 7, 2, 2, 'vip', 'C?? h??? b??i', null, 3),
('DV-0003','Room Twin 01', 5000, '1000000', 2, 4, 3, 'normal', 'C?? tivi', null, null),
('DV-0004','Villa No Beach Front', 22000, '9000000', 8, 3, 1, 'normal', 'C?? h??? b??i', 300,3),
('DV-0005','House Princess 02', 10000, '4000000', 5, 3, 2, 'normal', 'C?? th??m b???p n?????ng', null, 2),
('DV-0006','Room Twin 02', 3000, '900000', 2, 4, 3, 'normal', 'C?? tivi', null, null);

-- alter table advance_services drop column advance_service_quantity;
-- alter table advance_services add column advance_service_quantity varchar(45) after advance_service_status;


INSERT INTO `case_study`.`advance_services` (`advance_service_name`, `advance_service_price`, `advance_service_status`, `advance_service_quantity`) VALUES 
('Karaoke', '10000', 'ti???n nghi, hi???n t???i', 'gi???'),
('Thu?? xe m??y', '10000', 'h???ng 1 xe', 'chi???c'),
('Thu?? xe ?????p', '20000', 't???t', 'chi???c'),
('Buffe bu???i s??ng', '15000', '?????y ????? ????? ??n, tr??ng mi???ng', 'su???t'),
('Buffe bu???i tr??a', '90000', '?????y ????? ????? ??n, tr??ng mi???ng', 'su???t'),
('Buffe bu???i t???i', '16000', '?????y ????? ????? ??n, tr??ng mi???ng', 'su???t');

insert into contracts value (1,'2020-12-08','2020-12-08',0,3,1,3),
(2,'2020-07-14','2020-07-21',200000,7,3,1),
(3,'2021-03-15','2021-03-17',50000,3,4,2),
(4,'2021-01-14','2021-01-18',100000,7,5,5),
(5,'2021-07-14','2021-07-15',0,	7,2,6),
(6,'2021-06-01','2021-06-03',0,	7,7,6),
(7,'2021-09-02','2021-09-05',100000,7,4,4),
(8,'2021-06-17','2021-06-18',150000,3,4,1),
(9,'2020-11-19','2020-11-19',0,	3,4,3),
(10,'2021-04-12','2021-04-14',0,10,3,5),
(11,'2021-04-25','2021-04-25',0,2,2,1),
(12,'2021-05-25','2021-05-27',0,7,10,1);


INSERT INTO `case_study`.`contract_details` (`contract_detail_code`, `contract_code`, `advance_service_code`, `contract_detail_quantity`) VALUES (1, 2, 4, 5);
INSERT INTO `case_study`.`contract_details` (`contract_detail_code`, `contract_code`, `advance_service_code`, `contract_detail_quantity`) VALUES (2, 2, 5, 8);
INSERT INTO `case_study`.`contract_details` (`contract_detail_code`, `contract_code`, `advance_service_code`, `contract_detail_quantity`) VALUES (3, 2, 6, 15);
INSERT INTO `case_study`.`contract_details` (`contract_detail_code`, `contract_code`, `advance_service_code`, `contract_detail_quantity`) VALUES (4, 3, 1, 1);
INSERT INTO `case_study`.`contract_details` (`contract_detail_code`, `contract_code`, `advance_service_code`, `contract_detail_quantity`) VALUES (5, 3, 2, 11);
INSERT INTO `case_study`.`contract_details` (`contract_detail_code`, `contract_code`, `advance_service_code`, `contract_detail_quantity`) VALUES (6, 1, 3, 1);
INSERT INTO `case_study`.`contract_details` (`contract_detail_code`, `contract_code`, `advance_service_code`, `contract_detail_quantity`) VALUES (7, 1, 2, 2);
INSERT INTO `case_study`.`contract_details` (`contract_detail_code`, `contract_code`, `advance_service_code`, `contract_detail_quantity`) VALUES (8, 12, 2, 2);
