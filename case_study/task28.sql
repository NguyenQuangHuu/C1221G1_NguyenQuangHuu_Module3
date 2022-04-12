delimiter //
drop procedure if exists sp_3 //
create procedure sp_3()
begin
declare service_result int default 0;
declare completed int default 0;
declare con_tro cursor for
select services.service_code
from services inner join contracts on services.service_code=contracts.service_code
inner join service_type on services.service_type_code = service_type.service_type_code
where service_type.service_type_name='room' and year(contracts.service_start_date) between '2015' and '2025';
declare continue handler for not found set completed=1;
open con_tro;
get_list: loop
fetch from con_tro into services;
if completed =1 then
leave get_list;
end if ;
delete from contracts where contracts.contract_code=service_result;
delete from services where services.service_code=service_result;
end loop get_list;
close con_tro;
end//