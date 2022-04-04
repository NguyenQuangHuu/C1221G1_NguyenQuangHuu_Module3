use case_study;
select c.customer_code,
       c.customer_name,
       ct.customer_type_name,
       con.contract_code,
       s.service_name,
       con.contract_start_date,
       con.contract_end_date,
       sum(s.service_rent_fee+coalesce(`as`.advance_service_sprice*cd.contract_detail_quantity,0))
       from customers c
    left join contracts con on c.customer_code = con.customer_code
    left join customer_type ct on c.customer_type_code = ct.customer_type_code
    left join services s on con.service_code = s.service_code
    left join contract_details cd on con.contract_code = cd.contract_code
    left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code
group by con.contract_code
order by c.customer_code;