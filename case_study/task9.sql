use case_study;

select month(contract_end_date) as month,count(ct.customer_code) as so_luong_khach_hang from contracts ct inner join customers cus on ct.customer_code = cus.customer_code where year(ct.contract_end_date) =2021 group by month(ct.contract_end_date) order by month(ct.contract_end_date) asc;


