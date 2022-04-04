use case_study;

drop trigger tr_delete_contract;
drop procedure delete_contracts;

create table record_log(
    id_log int auto_increment primary key ,
    date_log date,
    numbers_record int
);

delimiter //
create procedure delete_contracts(in id_input int)
begin
    set sql_safe_updates = 0;
    set foreign_key_checks  = 0;
    delete from contracts where contract_code = id_input;
    set foreign_key_checks  = 1;
    set sql_safe_updates = 1;
end //
delimiter //

DELIMITER //
create trigger tr_delete_contract
    after delete
    on contracts for each row
begin
    declare sum_record int;

    set sum_record = (select count(contract_code) from contracts );
    insert into record_log set date_log = now(),numbers_record = sum_record;
end//
DELIMITER //

set @input_id = 11;
call delete_contracts(@input_id);

select * from record_log order by id_log desc limit 1;
