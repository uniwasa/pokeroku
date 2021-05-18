select
	pokemon.id
	,pokemon.height
	,pokemon.weight
	,pokemon.base_experience
	,pokemon_species.id as species_id
	,pokemon.identifier
	,pokemon_species.identifier as species_identifier
	,max(case when pokemon_types.slot = 1 then pokemon_types.type_id end) as first_type
	,max(case when pokemon_types.slot = 2 then pokemon_types.type_id end) as second_type
	,max(case when pokemon_types.slot = 1 then types.identifier end) as first_type_identifier
	,max(case when pokemon_types.slot = 2 then types.identifier end) as second_type_identifier
	,max(case when pokemon_types.slot = 1 then type_names.name end) as first_type_name
	,max(case when pokemon_types.slot = 2 then type_names.name end) as second_type_name
	,max(case when pokemon_stats.stat_id = 1 then base_stat end) as hp
	,max(case when pokemon_stats.stat_id = 2 then base_stat end) as attack
	,max(case when pokemon_stats.stat_id = 3 then base_stat end) as defense
	,max(case when pokemon_stats.stat_id = 4 then base_stat end) as special_attack
	,max(case when pokemon_stats.stat_id = 5 then base_stat end) as special_defense
	,max(case when pokemon_stats.stat_id = 6 then base_stat end) as speed
	,max(case when pokemon_species_names.local_language_id = 1 then pokemon_species_names.name end) as name_jp
	,max(case when pokemon_species_names.local_language_id = 9 then pokemon_species_names.name end) as name_en
	,pokemon.is_default
	,max(case when pokemon_form_names.local_language_id = 1 then pokemon_form_names.form_name end) as form_name_jp
	,max(case when pokemon_form_names.local_language_id = 9 then pokemon_form_names.form_name end) as form_name_en
	,pokesprite_icons.path as pokesprite_path
	from pokemon
inner join pokemon_species
	on pokemon.species_id = pokemon_species.id
inner join pokemon_species_names
	on pokemon_species.id = pokemon_species_names.pokemon_species_id
inner join pokemon_types
	on pokemon.id = pokemon_types.pokemon_id
inner join types
	on pokemon_types.type_id = types.id
inner join type_names
	on types.id = type_names.type_id
	and type_names.local_language_id = 1
inner join pokemon_stats
	on pokemon.id = pokemon_stats.pokemon_id
inner join pokemon_forms
	on pokemon.id = pokemon_forms.pokemon_id
	and pokemon_forms.is_default = 1
left join pokemon_form_names
	on pokemon_forms.id = pokemon_form_names.pokemon_form_id
left join pokesprite_icons
	on pokemon.identifier = pokesprite_icons.pokemon_identifier
group by pokemon.id