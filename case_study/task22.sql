use case_study;

update v_employees set v_employees.employee_address = 'Liên chiểu' where v_employees.employee_code in (
    select v_employees.employee_code from v_employees);


