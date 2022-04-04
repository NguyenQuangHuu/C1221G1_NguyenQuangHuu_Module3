use case_study;

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







