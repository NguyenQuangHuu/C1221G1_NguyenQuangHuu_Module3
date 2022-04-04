use case_study;

select c.customer_code,c.customer_name from contracts left join customers c on contracts.customer_code = c.customer_code
where year(contract_end_date) < 2021;







