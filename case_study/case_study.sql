-- task 2:
use case_study;
INSERT INTO employees VALUES (12, 'Hòa Phú Nhuận', '1994-12-03', 0, '123423121', '90000000', '0999969969', 'kim_yen@gmail.com', 'Đà Nẵng', 2, 4, 3);
select employee_code,employee_name,char_length(employee_name) as length_name from employees where 
employee_name like 'T%'  or
employee_name like 'H%'  or
employee_name like 'K%'   having length_name <= 15 ;

-- task 3:

select c.customer_code,c.customer_name,c.customer_dob,c.customer_address,datediff(curdate(),c.customer_dob)/365 as age from customers c where (datediff(curdate(),c.customer_dob)/365 between 18 and 50) and (customer_address like '%Đà Nẵng' or customer_address like '%Quảng Trị');

-- task4;

select c.customer_code,c.customer_name,count(con.contract_code) as booking from customers c inner join contracts con on c.customer_code = con.customer_code inner join customer_type ct on c.customer_type_code = ct.customer_type_code where ct.customer_type_name = "Diamond" group by c.customer_name order by booking asc;
-- c.customer_code,c.customer_name
-- task 5:

select * from customers c inner join contracts con on c.customer_code = con.customer_code ;

-- select  cus.customer_code,cus.customer_name,c_type.customer_type_name,con.contract_code,con.contract_start_date,con.contract_end_date
-- from contracts con right join contract_details con_d on con.contract_code = con_d.contract_code 
-- inner join advance_services ad on con_d.advance_service_code = ad.advance_service_code 
-- inner join customers cus on con.customer_code = cus.customer_code 
-- inner join customer_type c_type on cus.customer_type_code = c_type.customer_type_code
-- inner join services ser on ser.service_code = con.service_code group by con.contract_code;

select cus.customer_code,cus.customer_name,con.contract_code,cty.customer_type_name,
con.contract_code,ser.service_name,con.contract_start_date,
con.contract_end_date,
sum(ser.service_rent_fee + 
coalesce(cd.contract_detail_quantity*ads.advance_service_sprice,0))  
as total_pay from contracts con 
inner join services ser on con.service_code = ser.service_code 
right join customers cus on cus.customer_code = con.customer_code 
inner join customer_type cty 
on cus.customer_type_code = cty.customer_type_code 
left join contract_details cd on con.contract_code = cd.contract_code 
left join advance_services ads 
on cd.advance_service_code = ads.advance_service_code 
group by con.contract_code 
order by cus.customer_code asc,total_pay asc;



-- task 6;
select distinct ct.service_code from contracts ct where ct.service_code not in(select ct.service_code from contracts ct where ct.contract_start_date between '2021-01-01' and '2021-03-31');
-- task 7:

select  s.service_code,s.service_name,s.service_usable_area,
s.service_maximum_capacity,service_rent_fee,st.service_type_name
 from contracts ct left join services s on ct.service_code = s.service_code
 left join service_type st on s.service_type_code = st.service_type_code
 where s.service_code not in (select contracts.service_code from contracts where year(contracts.contract_start_date)=2021) group by s.service_code;

-- task 8:

select customer_name from customers union select customer_name from customers;

select distinct customer_name from customers;

select customer_name from customers group by customer_name;


-- task 9:
select month(contract_end_date) as month,count(ct.customer_code) as so_luong_khach_hang from contracts ct inner join customers cus on ct.customer_code = cus.customer_code where year(ct.contract_end_date) =2021 group by month(ct.contract_end_date) order by month(ct.contract_end_date) asc;
-- task 10:
select *,sum(coalesce(cd.contract_detail_quantity,0)) from contracts ct left join contract_details cd on ct.contract_code = cd.contract_code left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code group by ct.contract_code;

-- task 11:
select `as`.advance_service_code,`as`.advance_service_name from customers  cus
    left join contracts c
        on cus.customer_code = c.customer_code
    left join customer_type ct
        on cus.customer_type_code = ct.customer_type_code
    left join contract_details cd
        on c.contract_code = cd.contract_code
    left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code
where (cus.customer_address like '%Vinh'
or cus.customer_address like '%Quảng Ngãi')
and customer_type_name = 'Diamond' group by `as`.advance_service_code;

-- task 11:
-- select * from contracts inner join employees e on contracts.employee_code = e.employee_code;


-- task 12:
select ct.contract_code,e.employee_name,c.customer_name,customer_phone_number,
       s.service_code,s.service_name,sum(cd.contract_detail_quantity) as count_service,
       ct.contract_deposit
    from contracts ct
    left join customers c on ct.customer_code = c.customer_code
    left join employees e on ct.employee_code = e.employee_code
    left join contract_details cd on ct.contract_code = cd.contract_code
    left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code
    left join services s on ct.service_code = s.service_code
    where ((quarter(ct.contract_end_date) = 4
               and year(ct.contract_end_date)=2020)
      and ct.contract_code not in (select ct.contract_code
      from contracts ct where quarter(ct.contract_end_date)
                                  in (1,2)
                          and year(contract_end_date)=2021))
group by ct.contract_code;


-- task 13:
select *,sum(cd.contract_detail_quantity) as number_used
    from contract_details cd
    right join advance_services `as`
    on cd.advance_service_code = `as`.advance_service_code
    where (select max(cd.contract_detail_quantity) from contract_details cd)
    group by cd.advance_service_code having number_used = (select sum(contract_detail_quantity) as sum_quantity
    from contract_details group by contract_detail_quantity order by sum_quantity desc limit 1);

DELIMITER //
create procedure sum_used_number()
begin
select *,sum(cd.contract_detail_quantity) from contract_details cd right join advance_services
    on cd.advance_service_code = advance_services.advance_service_code
group by cd.advance_service_code;
end//
DELIMITER //


-- task 14:

select c.contract_code,st.service_type_name,`as`.advance_service_name,count(cd.advance_service_code) as number_used from contract_details cd
    left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code
    left join contracts c on cd.contract_code = c.contract_code
    left join services s on c.service_code = s.service_code
    left join service_type st on s.service_type_code = st.service_type_code
group by `as`.advance_service_code having number_used = 1 order by c.contract_code asc;

-- task 15:

select employees.employee_code,employees.employee_name,
       l.level_name,d.department_name,employees.employee_phone_number,
       employees.employee_address,
       count(c.employee_code) as number_contracts from employees right join contracts c on employees.employee_code = c.employee_code
left join levels l on employees.level_code = l.level_code
left join departments d on employees.department_code = d.department_code
group by c.employee_code having number_contracts <= 3 order by employees.employee_code asc ;


-- task 16:

select e.employee_code,e.employee_name from employees e where employee_code not in(
    select c.employee_code from contracts c inner join employees e on c.employee_code = e.employee_code
    where (year(c.contract_start_date) between 2019 and 2021) group by c.employee_code
);

-- task 17:
update customers set customer_type_code = 'Diamond' where (
      select c.customer_code,c2.customer_name,
      ct.customer_type_code,
      sum(s.service_rent_fee +
      coalesce(contract_detail_quantity * advance_service_sprice, 0)) as total_pay
      from contracts c
      left join services s on c.service_code = s.service_code
      left join contract_details cd on c.contract_code = cd.contract_code
      left join advance_services `as`
      on cd.advance_service_code = `as`.advance_service_code
      left join customers c2 on c.customer_code = c2.customer_code
      left join customer_type ct on c2.customer_type_code = ct.customer_type_code
      where (year(c.contract_end_date) = 2021) and having total_pay > 10000000
	
	
);


-- task 18:
select c.customer_code,c.customer_name
 from contracts left join customers c on contracts.customer_code = c.customer_code
where year(contract_end_date) < 2021;


-- task 19:

update advance_services set advance_service_sprice = advance_service_sprice*2 where advance_service_code = ( select advance_services.advance_service_code from advance_services
right join contract_details cd on advance_services.advance_service_code = cd.advance_service_code
right join contracts c on cd.contract_code = c.contract_code
where year(contract_end_date) = 2020 and(contract_detail_quantity > 10));

-- task 20:

select e.employee_code,e.employee_name,e.employee_email,e.employee_phone_number,e.employee_dob,e.employee_address
from employees e union all select c.customer_code,c.customer_name,c.customer_email,c.customer_phone_number,c.customer_dob,customer_address from customers c;


-- task 21:

create view  v_employees as select * from employees left join contracts on employees.employee_code = contracts.employee_code where employee_address like '%Hải Châu%' and (contract_start_date ='2019-12-12');
-- task 22:

update v_employees set v_employees.employee_address = 'Liên chiểu' where v_employees.employee_code in (
    select v_employees.employee_code from v_employees);

-- task 23:

DELIMITER //
create procedure sp_delete_customer_by_id(in customer_id_input int)
begin
    delete from customers where customer_code = customer_id_input;
end //
DELIMITER //

set @id_input = 1;
call sp_delete_customer_by_id(@id_input);


-- task 24:
delimiter //
create procedure add_new_contract(input_start_date date,
                                    input_end_date date,
                                    input_deposit double,
                                    input_employee_code int,
                                    input_customer_code int,
                                    input_service_code int
                                    )
begin
    DECLARE check_employee_code,check_service_code,check_customer_code,check_date_create int default -1;
    If (input_employee_code in (select employee_code from employees))
	then set check_employee_code = input_employee_code;
    else set check_employee_code = -1;
    end if;

    If(input_customer_code in (select customer_code from customers))
    then set check_customer_code = input_customer_code;
    else set check_customer_code = -1;
    end if;

    If(input_service_code in (select service_code from services))
    then set check_service_code = input_service_code;
    else set check_service_code = -1;
    end if;
    
	If((input_start_date - input_end_date)<0)
    then set check_date_create = 0;
    else set check_date_create = -1;
    end if;
    
    If(check_employee_code >= 0 
    and check_customer_code >= 0 
    and check_service_code >= 0
    and check_date_create >=0)
        then insert into contracts
            (
            contract_start_date,
            contract_end_date,
            contract_deposit,
            employee_code,
            customer_code,
            service_code
            )
            value
            (input_start_date,
            input_end_date,
            input_deposit,
            input_employee_code,
            input_customer_code,
            input_service_code);
        else signal sqlstate '45000' set message_text = 'NO RECORD CREATE';
        end if;
end//
delimiter //


-- task 25:
DELIMITER //
create trigger tr_delete_contract after delete
    on contracts for each row
    select count(contract_code) from contracts;
DELIMITER //

-- task 26:

DELIMITER //
create trigger tr_update_contract before update
    on contracts for each row
    if ((NEW.contract_end_date - contract_start_date) < 2) then
        signal sqlstate '45000' set message_text = 'Wrong format';
    else set OLD.contract_end_date = NEW.contract_end_date;
    end if;
DELIMITER //



-- task 27:

DELIMITER //
create function func_count_service()
returns int(5)
begin
    select sum(s.service_rent_fee+coalesce(advance_service_sprice*contract_detail_quantity,0)) as total_service
        from contracts
        left join contract_details cd
        on contracts.contract_code = cd.contract_code
        left join advance_services `as`
        on cd.advance_service_code = `as`.advance_service_code
        left join services s
        on contracts.service_code = s.service_code
        group by contracts.service_code having total_service > 2000000;
end //
DELIMITER //

-- task 28:
delimiter //
drop procedure if exists sp_3 //
create procedure sp_3()
begin
declare service_result int default 0;
declare completed int default 0;
declare con_tro cursor for
select services.service_code
from services inner join contracts on services.service_code=contracts.service_code
inner join service_type on services.service_type_code = service_type.service_type_code
where service_type.service_type_name='room' and year(contracts.service_start_date) between '2015' and '2025';
declare continue handler for not found set completed=1;
open con_tro;
get_list: loop
fetch from con_tro into services;
if completed =1 then
leave get_list;
end if ;
delete from contracts where contracts.contract_code=service_result;
delete from services where services.service_code=service_result;
end loop get_list;
close con_tro;
end//


