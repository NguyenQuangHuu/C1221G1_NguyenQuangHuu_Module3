use case_study;

DELIMITER //
create procedure sp_delete_customer_by_id(in customer_id_input int)
begin
    delete from customers where customer_code = customer_id_input;
end //
DELIMITER //

set @id_input = 1;
call sp_delete_customer_by_id(@id_input);
