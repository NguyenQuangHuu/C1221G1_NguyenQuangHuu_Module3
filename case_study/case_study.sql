drop database if exists case_study;
create database case_study;
use case_study;

create table customer_type(
customer_type_code int not null auto_increment primary key,
customer_type_name varchar(45) not null
);
create table customers(
customer_code int not null auto_increment primary key,
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
service_code int not null auto_increment primary key,
service_name varchar(45) not null,
service_usable_area double not null check (service_usable_area >=30),
service_rent_fee double not null check(service_rent_fee>0),
service_number_capacity int not null check (service_number_capacity>0),
rent_type_code int not null,
service_type_code int not null,
service_room_type varchar(45) not null,
service_advance varchar(45) not null,
service_swimming_pool_area double not null check(service_swimming_pool_area>=30),
service_floor int not null,
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
foreign key (position_code) references positions(position_code),
foreign key (level_code) references levels(level_code),
foreign key (department_code) references departments(department_code)
);

create table contracts(
contract_code int not null auto_increment primary key,
contract_start_date datetime not null,
contract_end_date datetime not null,
contract_deposit double not null,
employee_code int not null,
customer_code int not null,
service_code int not null,
foreign key (employee_code) references employees(employee_code),
foreign key (customer_code) references customers(customer_code),
foreign key (service_code) references services(service_code)
);
create table advance_services(
advance_service_code int not null auto_increment primary key,
advance_service_name varchar(45) not null,
advance_service_sprice double not null,
advance_service_status varchar(45) not null
);
create table contract_details(
contract_detail_code int not null auto_increment primary key,
contract_code int not null,
advance_service_code int not null,
contract_detail_quantity int default 1,
foreign key (contract_code) references contracts(contract_code),
foreign key (advance_service_code) references advance_services(advance_service_code)
);

insert into case_study.positions(position_name) value ("RECEPTIONIST"),("WAITER"),("SPECIALIST"),("SUPERVISOR"),("MANAGER"),("DIRECTOR");
insert into case_study.levels(level_name) value ("INTERMEDIATE"),("ASSOCIATE"),("UNIVERSITY"),("POSTGRADUATE");
insert into case_study.departments(department_name) value("SALE-MARKETING DEPARTMENT"),("ADMINISTRATION DEPARTMENT"),("CUSTOMER SERVICE DEPARTMENT"),("HUMAN RESOURCES DEPARTMENT");


insert into case_study.employees(employee_code,employee_name,employee_dob,employee_gender,employee_passport_id,employee_salary,employee_phone_number,employee_email,employee_address,position_code,level_code,department_code) values(1,"Nguyen Quang Huu","1994-03-23",1,"123456789",60000000,"0999999999","nguyenquanghuu2010@gmail.com","Đà Nẵng",6,2,4),
(2,"Andy Kim","1996-03-23",1,"123456729",10000000,"0996123221","andy.kim@gmail.com","Đà Nẵng",1,2,4),
(3,"Kim Tan","1992-03-23",1,"123456719",20000000,"0999953299","kim.tan@gmail.com","Quảng Trị",2,2,4),
(4,"Xang Tang","1990-03-23",0,"123456749",30000000,"0999333999","xang.tang@gmail.com","Quảng Trị",3,2,4),
(5,"Duong Tang","1989-03-23",1,"123456239",30000000,"0999952399","duong_tang@gmail.com","Đà Nẵng",4,2,4),
(6,"Nguyen Kim","1979-03-23",0,"123456189",30000000,"0999123999","nguyen.kim_plaza@gmail.com","Đà Nẵng",3,2,4),
(7,"Cao Loon","1950-03-23",0,"123456389",20000000,"0999123999","cao.loon@gmail.com","Hồng Kông",2,2,4),
(8,"Solar Khun","1969-03-23",1,"123426789",50000000,"0999993129","solar_khun@gmail.com","Thái Lan",5,2,4);

insert into case_study.customer_type(customer_type_name) value("DIAMOND"),("PLATINUM"),("GOLD"),("SILVER"),("MEMBER");

insert into case_study.customers(customer_code,customer_name,customer_dob,customer_gender,customer_passport_id,customer_phone_number,customer_email,customer_address,customer_type_code) values
(1,"Nguyen Quang Huu","1994-03-23",1,"123456789","0999999999","nguyenquanghuu2010@gmail.com","Đà Nẵng",1),
(2,"Andy Kim","1996-03-23",1,"123456729","0996123221","andy.kim@gmail.com","Đà Nẵng",2),
(3,"Kim Tan","1992-03-23",1,"123456719","0999953299","kim.tan@gmail.com","Quảng Trị",3),
(4,"Xang Tang","1990-03-23",0,"123456749","0999333999","xang.tang@gmail.com","Quảng Trị",4),
(5,"Duong Tang","1989-03-23",1,"123456239","0999952399","duong_tang@gmail.com","Đà Nẵng",5),
(6,"Nguyen Kim","1979-03-23",0,"123456189","0999123999","nguyen.kim_plaza@gmail.com","Đà Nẵng",3),
(7,"Cao Loon","1950-03-23",0,"123456389","0999123999","cao.loon@gmail.com","Hồng Kông",2),
(8,"Solar Khun","1969-03-23",1,"123426789","0999993129","solar_khun@gmail.com","Thái Lan",3);

insert into case_study.rent_type(rent_type_name) value ("HOURS"),("DAYS"),("MONTHS"),("YEARS");

insert into case_study.service_type(service_type_name) value ("VILLA"),("HOUSE"),("ROOM");


insert into case_study.services(service_name,service_usable_area,service_rent_fee,service_number_capacity,rent_type_code,service_type_code,service_room_type,service_advance,service_swimming_pool_area,service_floor) values("Summer Villa",31.0,0.4,10,2,1,"VIP","Cà phê, ăn sáng buffet miễn phí",31.5,2),
("Summer House",31.0,0.4,10,2,1,"Superior","Cà phê, ăn sáng buffet miễn phí",31.5,2),
("Summer Room",31.0,0.4,10,2,1,"Standard","Cà phê, hồ bơi vô cùng cực",31.5,1),
("Spring Villa",31.0,0.4,10,2,1,"Deluxe","Cà phê, ăn sáng buffet miễn phí",31.5,3),
("Spring House",31.0,0.4,10,2,1,"Suite","Cà phê,hồ bơi vô cùng cực",31.5,2),
("Spring Room",31.0,0.4,10,2,1,"VIP","Cà phê, hồ bơi vô cùng cực",31.5,1)
;

INSERT INTO `case_study`.`contracts` (`contract_code`, `contract_start_date`, `contract_end_date`, `contract_deposit`, `employee_code`, `customer_code`, `service_code`) VALUES 
('1', '2022-12-03', '2022-12-04', '2000000', '1', '1', '1'),
('2', '2022-12-03', '2022-04-01', '2000000', '2', '2', '2'),
('3', '2022-12-03', '2022-05-03', '2000000', '2', '3', '2'),
('4', '2022-12-03', '2022-06-03', '2000000', '1', '1', '1'),
('5', '2022-12-03', '2022-07-03', '2000000', '2', '3', '3'),
('6', '2022-12-03', '2022-08-03', '2000000', '3', '1', '2')
;
