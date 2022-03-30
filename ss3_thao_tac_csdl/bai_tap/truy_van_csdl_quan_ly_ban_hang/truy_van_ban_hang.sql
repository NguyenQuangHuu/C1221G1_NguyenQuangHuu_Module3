create database ss3_quan_li_ban_hang;
use ss3_quan_li_ban_hang;

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

INSERT INTO ss3_quan_li_ban_hang.customers VALUES ('2', 'Ngoc Oanh', '20');
INSERT INTO ss3_quan_li_ban_hang.customers VALUES ('3', 'Hong Ha', '50');

select order_id,order_date,order_total_price from orders;

select c.customer_name,p.product_name from order_details od inner join orders o on od.order_id = o.order_id join products p on od.product_id = p.product_id join customers c on c.customer_id = o.customer_id;

select customers.customer_name,count(orders.customer_id) as buy_count from orders right join customers on customers.customer_id = orders.customer_id group by customers.customer_name having buy_count = 0;


select o.order_id,o.order_date,sum(p.product_price * od.order_detail_quantity) as total from orders o inner join order_details od on o.order_id = od.order_id inner join products p on p.product_id = od.product_id group by o.order_id;
