select
	types.*
	,max(case when type_names.local_language_id = 1 then type_names.name end) as name_jp
from types
inner join type_names
	on types.id = type_names.type_id
where types.id < 10000
group by types.id