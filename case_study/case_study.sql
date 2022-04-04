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

select s.service_code,s.service_name,s.service_rent_fee,st.service_type_name from services s left join service_type st 
on s.service_type_code = st.service_type_code
left join contracts ct on s.service_code = ct.service_code
where s.service_code not in 
(select ct.service_code from contracts where year(ct.contract_start_date)=2021 and quarter(ct.contract_start_date) in (2,3,4))
group by s.service_code
;

-- task 7:

select  * from contracts ct where service_code not in (select service_code from contracts where year(contract_start_date)=2021) group by service_code;

-- task 8:

select customer_name from customers union select customer_name from customers;

select distinct customer_name from customers;

select customer_name from customers group by customer_name;


-- task 9:
select month(contract_end_date) as month,count(ct.employee_code) as so_luong_khach_hang from contracts ct inner join customers cus on ct.customer_code = cus.customer_code where year(ct.contract_end_date) =2021 group by month(ct.contract_end_date) order by month(ct.contract_end_date) asc;

select *,sum(coalesce(cd.contract_detail_quantity,0)) from contracts ct left join contract_details cd on ct.contract_code = cd.contract_code left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code group by ct.contract_code;

-- task 10:
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
select * from contracts inner join employees e on contracts.employee_code = e.employee_code;


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
    group by cd.advance_service_code having number_used;


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
update customers set customer_type_code = 1 where (
                                                      select c.customer_code,
                                                             customer_name,
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
                                                      where (year(c.contract_end_date) = 2021)
                                                        and (ct.customer_type_name = 'Platinum')
                                                      group by c2.customer_name
                                                      having total_pay > 10000000
);


-- task 18:





