select
	pokemon.id
	,pokemon.identifier
	,pokemon_species.identifier as species_identifier
	,max(case when pokemon_types.slot = 1 then pokemon_types.type_id end) as first_type
	,max(case when pokemon_types.slot = 2 then pokemon_types.type_id end) as second_type
	,max(case when pokemon_types.slot = 1 then types.identifier end) as first_type_identifier
	,max(case when pokemon_types.slot = 2 then types.identifier end) as second_type_identifier
	,max(case when pokemon_types.slot = 1 then type_names.name end) as first_type_name
	,max(case when pokemon_types.slot = 2 then type_names.name end) as second_type_name
	,max(case when pokemon_stats.stat_id = 1 then base_stat end) as H
	,max(case when pokemon_stats.stat_id = 2 then base_stat end) as A
	,max(case when pokemon_stats.stat_id = 3 then base_stat end) as B
	,max(case when pokemon_stats.stat_id = 4 then base_stat end) as C
	,max(case when pokemon_stats.stat_id = 5 then base_stat end) as D
	,max(case when pokemon_stats.stat_id = 6 then base_stat end) as S
	,pokemon_species_names.name as name_jp
	from pokemon
inner join pokemon_species
	on pokemon.species_id = pokemon_species.id
inner join pokemon_species_names
	on pokemon_species.id = pokemon_species_names.pokemon_species_id
	and pokemon_species_names.local_language_id = 1
inner join pokemon_types
	on pokemon_species.id = pokemon_types.pokemon_id
inner join types
	on pokemon_types.type_id = types.id
inner join type_names
	on types.id = type_names.type_id
	and type_names.local_language_id = 1
inner join pokemon_stats
	on pokemon_species.id = pokemon_stats.pokemon_id
where pokemon.is_default = 1
group by pokemon.id