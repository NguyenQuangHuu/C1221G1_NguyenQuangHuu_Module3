use case_study;

select e.employee_code,e.employee_name,e.employee_email,e.employee_phone_number,e.employee_dob,e.employee_address
from employees e union all select c.customer_code,c.customer_name,c.customer_email,c.customer_phone_number,c.customer_dob,customer_address from customers c;





