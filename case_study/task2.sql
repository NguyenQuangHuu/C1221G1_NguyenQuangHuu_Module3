use case_study;
INSERT INTO employees VALUES (12, 'Hòa Phú Nhuận', '1994-12-03', 0, '123423121', '90000000', '0999969969', 'kim_yen@gmail.com', 'Đà Nẵng', 2, 4, 3);
select employee_code,employee_name,char_length(employee_name) as length_name from employees where
        employee_name like 'T%'  or
        employee_name like 'H%'  or
        employee_name like 'K%'  having length_name <= 15 ;
