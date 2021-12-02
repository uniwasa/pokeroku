select 
	abilities.id
	,abilities.identifier
	,pokemon_abilities.slot
	,pokemon_abilities.is_hidden
	,max(case when ability_names.local_language_id = 1 then ability_names.name end) as name_jp
	,max(case when ability_flavor_text.language_id = 11 then ability_flavor_text.flavor_text end) as flavor_text_jp
from pokemon_abilities
inner join abilities
	on pokemon_abilities.ability_id = abilities.id
inner join ability_names
	on abilities.id = ability_names.ability_id
inner join ability_flavor_text
	on abilities.id = ability_flavor_text.ability_id
	and ability_flavor_text.version_group_id =
	(select max(version_group_id) from ability_flavor_text flavor where ability_flavor_text.ability_id = flavor.ability_id)
where pokemon_id = ?
group by abilities.id
order by pokemon_abilities.slot