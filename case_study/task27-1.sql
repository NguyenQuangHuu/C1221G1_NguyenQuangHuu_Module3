
delimiter //
drop function if exists count_services_function;
create function count_services_function() returns integer
    deterministic
begin
    declare tong_cong integer;
    set tong_cong = (select count(*) as tong from (select
                (services.service_rent_fee + coalesce(`as`.advance_service_sprice*cd.contract_detail_quantity,0)) as total_pay
                from services inner join contracts c
                on services.service_code = c.service_code
                left join contract_details cd on c.contract_code = cd.contract_code
                left join advance_services `as` on cd.advance_service_code = `as`.advance_service_code
                group by services.service_code having total_pay > 2000000) as table_a);
    return (tong_cong);
end //
delimiter //


select count_services_function();



