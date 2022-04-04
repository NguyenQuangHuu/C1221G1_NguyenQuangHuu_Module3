use case_study;

select `as`.advance_service_code,`as`.advance_service_name,sum(cd.contract_detail_quantity) as number_used
from contract_details cd
         right join advance_services `as`
                    on cd.advance_service_code = `as`.advance_service_code
where (select max(cd.contract_detail_quantity) from contract_details cd)
group by cd.advance_service_code having number_used = (select sum(contract_detail_quantity) as sum_quantity
                                                       from contract_details group by contract_detail_quantity order by sum_quantity desc limit 1);






