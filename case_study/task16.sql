use case_study;

select e.employee_code,e.employee_name from employees e where employee_code not in(
    select c.employee_code from contracts c inner join employees e on c.employee_code = e.employee_code
    where (year(c.contract_start_date) between 2019 and 2021) group by c.employee_code
);







