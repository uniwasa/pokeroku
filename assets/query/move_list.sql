select
	moves.*
	,max(case when move_names.local_language_id = 11 then move_names.name end) as name_jp
	,max(case when move_flavor_text.language_id = 11 then move_flavor_text.flavor_text end) as flavor_text_jp
	,max(case when move_damage_class_prose.local_language_id = 1 then move_damage_class_prose.name end) as damage_class_name_jp
from moves
inner join move_names
	on moves.id = move_names.move_id
inner join move_flavor_text
	on moves.id = move_flavor_text.move_id
	and move_flavor_text.version_group_id = 20
inner join move_damage_class_prose
	on moves.damage_class_id = move_damage_class_prose.move_damage_class_id
group by moves.id
