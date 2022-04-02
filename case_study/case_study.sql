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




