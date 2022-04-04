use case_study;

select employees.employee_code,employees.employee_name,
       l.level_name,d.department_name,employees.employee_phone_number,
       employees.employee_address,
       count(c.employee_code) as number_contracts from employees right join contracts c on employees.employee_code = c.employee_code
                                                                 left join levels l on employees.level_code = l.level_code
                                                                 left join departments d on employees.department_code = d.department_code
group by c.employee_code having number_contracts <= 3 order by employees.employee_code asc ;







