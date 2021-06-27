select
	s2.*
	,max(case when move_damage_class_prose.local_language_id = 1 then move_damage_class_prose.name end) as damage_class_name_jp
from(
	select
		s1.* 
		,max(case when move_flavor_text.language_id = 11 then move_flavor_text.flavor_text end) as flavor_text_jp
	from (
		select
			pokemon_moves.*
			,moves.*
			,max(case when move_names.local_language_id = 11 then move_names.name end) as name_jp
			,items.identifier as item_identifier
		from pokemon_moves
		inner join moves
			on pokemon_moves.move_id = moves.id
		left join machines
			on moves.id = machines.move_id
			and machines.version_group_id = 20
		left join items
			on machines.item_id = items.id
		inner join move_names
			on moves.id = move_names.move_id
		where pokemon_moves.pokemon_id = ?
			and pokemon_moves.pokemon_move_method_id != 2
			and pokemon_moves.version_group_id =
				(select max(version_group_id) from pokemon_moves pokemon_moves_copy
				where pokemon_moves.pokemon_id = pokemon_moves_copy.pokemon_id)
		group by moves.id, pokemon_moves.pokemon_move_method_id
		) s1
	inner join move_flavor_text
		on s1.id = move_flavor_text.move_id
		and move_flavor_text.version_group_id =
			(select max(version_group_id) from move_flavor_text move_flavor_text_copy
			where move_flavor_text.move_id = move_flavor_text_copy.move_id)
	group by s1.id, s1.pokemon_move_method_id
	) s2
inner join move_damage_class_prose
	on s2.damage_class_id = move_damage_class_prose.move_damage_class_id
group by s2.id, s2.pokemon_move_method_id
order by s2.pokemon_move_method_id, s2.level, s2."order", s2.id