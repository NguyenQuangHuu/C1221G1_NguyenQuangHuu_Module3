drop database if exists ss2_quan_ly_ban_hang;
create database ss2_quan_ly_ban_hang;
use ss2_quan_ly_ban_hang;

create table customers(
customer_id int not null auto_increment primary key,
customer_name varchar(50) not null,
customer_age tinyint not null
);

create table orders(
order_id int not null auto_increment primary key,
order_date date not null,
order_total_price double not null,
customer_id int not null,
foreign key (customer_id) references customers(customer_id)
);

create table products(
product_id int not null auto_increment primary key,
product_name varchar(100) not null,
product_price double not null
);

create table order_details(
order_id int not null,
product_id int not null,
order_detail_quantity int not null,
primary key(order_id,product_id),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);