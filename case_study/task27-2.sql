use case_study;

delimiter //
drop function if exists date_contract;
create function date_contract(id_customer int) returns integer
    deterministic
begin
    declare max_date_used int;

    set max_date_used = (select max(date_time) from (select ((contract_end_date-contract_start_date)/1000000) as date_time from contracts where customer_code = id_customer) as table_1);
    return max_date_used;
end //
delimiter //


select date_contract(3);




