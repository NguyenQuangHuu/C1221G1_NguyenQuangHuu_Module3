use case_study;

set sql_safe_updates = 0;
update advance_services set advance_service_sprice = (advance_service_sprice * 2)
where advance_services.advance_service_code = (
    select advance_services.advance_service_code from advance_services
    right join contract_details cd on advance_services.advance_service_code = cd.advance_service_code
    right join contracts c on cd.contract_code = c.contract_code
    where year(contract_end_date) = 2020 and(contract_detail_quantity > 10));
set sql_safe_updates = 1;





