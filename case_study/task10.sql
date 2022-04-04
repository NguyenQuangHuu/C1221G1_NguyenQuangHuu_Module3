use case_study;

select *,sum(coalesce(cd.contract_detail_quantity,0)) from contracts ct left join contract_details cd on ct.contract_code = cd.contract_code left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code group by ct.contract_code;

