use case_study;
select  s.service_code,s.service_name,s.service_usable_area,
        s.service_maximum_capacity,service_rent_fee,st.service_type_name
from contracts ct left join services s on ct.service_code = s.service_code
                  left join service_type st on s.service_type_code = st.service_type_code
where s.service_code not in (select contracts.service_code from contracts where year(contracts.contract_start_date)=2021) group by s.service_code;



