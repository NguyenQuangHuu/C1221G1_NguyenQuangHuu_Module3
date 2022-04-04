use case_study;

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