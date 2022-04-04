use case_study;

select ct.contract_code,e.employee_name,c.customer_name,customer_phone_number,
       s.service_code,s.service_name,sum(coalesce(cd.contract_detail_quantity,0)) as count_service,
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





