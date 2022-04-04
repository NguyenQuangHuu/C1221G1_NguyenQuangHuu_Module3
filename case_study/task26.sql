use case_study;


create procedure update_end_date(in contract_id int ,in end_date date)
begin
    set sql_safe_updates = 0;
    update contracts set contract_end_date = end_date where contract_code = contract_id;
    set sql_safe_updates = 1;
end;

create trigger tr_update_contract before update
    on contracts for each row
    if ((NEW.contract_end_date - Old.contract_start_date) < 2) then
        signal sqlstate '45000' set message_text = 'Date end of contract must be greater than date start of contract 2 days';
    end if;
DELIMITER //

call update_end_date(1,'2019-12-08');