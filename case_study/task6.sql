use case_study;
select distinct ct.service_code,s.service_name,service_usable_area,s.service_rent_fee,
                st.service_type_name from contracts ct left join services s
    on ct.service_code = s.service_code
left join service_type st on s.service_type_code = st.service_type_code
 where ct.service_code not in(select ct.service_code from contracts ct where ct.contract_start_date between '2021-01-01' and '2021-03-31');