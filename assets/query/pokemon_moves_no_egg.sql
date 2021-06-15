select
	*
	,max(case when move_names.local_language_id = 11 then move_names.name end) as name_jp
	,max(case when move_flavor_text.language_id = 11 then move_flavor_text.flavor_text end) as flavor_text_jp
from pokemon_moves
inner join moves
	on pokemon_moves.move_id = moves.id
inner join move_names
	on moves.id = move_names.move_id
inner join move_flavor_text
	on moves.id = move_flavor_text.move_id
	and move_flavor_text.version_group_id =
		(select max(version_group_id) from move_flavor_text move_flavor_text_copy
		where move_flavor_text.move_id = move_flavor_text_copy.move_id)
where pokemon_moves.pokemon_id = ?
	and pokemon_moves.pokemon_move_method_id != 2
	and pokemon_moves.version_group_id =
		(select max(version_group_id) from pokemon_moves pokemon_moves_copy
		where pokemon_moves.pokemon_id = pokemon_moves_copy.pokemon_id)
group by moves.id, pokemon_moves.pokemon_move_method_id
order by pokemon_moves.pokemon_move_method_id, pokemon_moves.level, pokemon_moves."order", moves.id