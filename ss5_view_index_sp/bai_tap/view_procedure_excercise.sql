drop table if exists products;
create table products(
    id int ,
    product_code int primary key auto_increment,
    product_name varchar(100) not null,
    product_price int not null default 0,
    product_amount int default 1,
    product_description varchar(100),
    product_status varchar(45)
);

insert into products value (2,1,'Keyboard',100000,2,'Global','In Stock');
insert into products value (3,2,'Keyboard',100000,1,'VN','In Stock');
insert into products value (4,3,'Keyboard',100000,3,'VN','In Stock');
insert into products value (5,4,'Keyboard A',100000,3,'VN','In Stock');
insert into products value (6,5,'Keyboard B',100000,3,'VN','In Stock');
insert into products value (7,7,'Keyboard C',100000,3,'VN','In Stock');
insert into products value (8,8,'Keyboard C',100000,3,'VN','In Stock');
insert into products value (9,9,'Keyboard C',100000,3,'VN','In Stock');
insert into products value (10,10,'Keyboard C',100000,3,'VN','In Stock');
insert into products value (11,11,'Keyboard C',100000,3,'VN','In Stock');
insert into products value (12,12,'Keyboard C',100000,3,'VN','In Stock');
insert into products value (13,13,'Keyboard C',100000,3,'VN','In Stock');
insert into products value (14,14,'Keyboard C',100000,3,'VN','In Stock');

explain select * from products where product_name like '% C';
create index product_code_index on products(product_code);
explain select * from products where product_name like '% C';


create index product_name_and_price on products(product_name,product_price);
explain select * from products where product_name like '%C';


create view product_view as select  product_code,product_name,product_price,product_status
from products;

select * from product_view;
update product_view set product_price = 2000 where product_code = 9;
update product_view set product_price = 2000 where product_code = 2;
update product_view set product_price = 3000 where product_code = 7;

drop view product_view;


DELIMITER //
create procedure show_all_product()
begin
    select * from products;
end //
DELIMITER //

call show_all_product();

DELIMITER //
create procedure add_product(in product_name_input varchar(100))
begin
    insert into products(product_name) value (product_name_input);
end //
DELIMITER //

set @input_new = 'kem đánh răng';
call add_product(@input_new);

DELIMITER //
create procedure edit_product(in id_input int,in product_name_input varchar(100))
begin
    update products set product_name = product_name_input where products.id = id_input;
end //
DELIMITER //

set @edit_id_input = 10;
set @edit_name_input = 'Kẹo cao su';
call edit_product(@edit_id_input,@edit_name_input);

DELIMITER //
create procedure delete_product_by_id(in id_input int)
begin
    delete from products where products.id = id_input;
end //
DELIMITER //

set @input_id = 13;
call delete_product_by_id(@input_id);

select * from products;