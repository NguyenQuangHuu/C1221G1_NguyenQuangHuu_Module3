use case_study;

select c.contract_code,st.service_type_name,`as`.advance_service_name,count(cd.advance_service_code) as number_used from contract_details cd
                                                                                                                             left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code
                                                                                                                             left join contracts c on cd.contract_code = c.contract_code
                                                                                                                             left join services s on c.service_code = s.service_code
                                                                                                                             left join service_type st on s.service_type_code = st.service_type_code
group by `as`.advance_service_code having number_used = 1 order by c.contract_code asc;






