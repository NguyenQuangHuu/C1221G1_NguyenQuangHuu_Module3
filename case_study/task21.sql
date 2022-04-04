use case_study;

create view  v_employees as select * from employees left join contracts on employees.employee_code = contracts.employee_code where employee_address like '%Hải Châu%' and (contract_start_date ='2019-12-12');



