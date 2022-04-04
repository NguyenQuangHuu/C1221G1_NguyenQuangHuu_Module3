use case_study;

drop procedure add_new_contract;

delimiter //
create procedure add_new_contract(input_start_date date,
                                  input_end_date date,
                                  input_deposit double,
                                  input_employee_code int,
                                  input_customer_code int,
                                  input_service_code int
)
begin
    DECLARE check_employee_code,check_service_code,check_customer_code,check_date_create int default -1;
    If (input_employee_code in (select employee_code from employees))
    then set check_employee_code = input_employee_code;
    else set check_employee_code = -1;
    end if;

    If(input_customer_code in (select customer_code from customers))
    then set check_customer_code = input_customer_code;
    else set check_customer_code = -1;
    end if;

    If(input_service_code in (select service_code from services))
    then set check_service_code = input_service_code;
    else set check_service_code = -1;
    end if;

    If((input_start_date - input_end_date)<=0)
    then set check_date_create = 0;
    else set check_date_create = -1;
    end if;

    If(check_employee_code >= 0
        and check_customer_code >= 0
        and check_service_code >= 0
        and check_date_create >=0)
    then insert into contracts
         (
             contract_start_date,
             contract_end_date,
             contract_deposit,
             employee_code,
             customer_code,
             service_code
         )
             value
             (input_start_date,
              input_end_date,
              input_deposit,
              input_employee_code,
              input_customer_code,
              input_service_code);
    signal  sqlstate '45000' set message_text = 'CREATE Success';
    else signal sqlstate '45000' set message_text = 'NO RECORD CREATE';
    end if;
end//
delimiter //

call add_new_contract('2022-04-04','2022-04-04',3000,3,2,3);