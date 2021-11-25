select
	items.*
	,max(case when item_names.local_language_id = 11 then item_names.name end) as name_jp
	,max(case when item_flavor_text.language_id = 11 then item_flavor_text.flavor_text end) as flavor_text_jp
from items
inner join item_flag_map
	on items.id = item_flag_map.item_id
	and item_flag_map.item_flag_id = 5
inner join item_names
	on items.id = item_names.item_id
inner join item_flavor_text
	on items.id = item_flavor_text.item_id
	and item_flavor_text.version_group_id = 20
group by items.id
