select
	s3.*
	,pokemon_forms.form_identifier
	,max(case when pokemon_form_names.local_language_id = 1 then pokemon_form_names.form_name end) as form_name_jp
	,max(case when pokemon_form_names.local_language_id = 9 then pokemon_form_names.form_name end) as form_name_en
	,my_pokesprite_icons.path as pokesprite_path
	,(select max(version_group_id) from pokemon_moves where pokemon_moves.pokemon_id = s3.id) as pokemon_move_version_group_id
from (
	select
		s2.*
		,max(case when pokemon_stats.stat_id = 1 then base_stat end) as hp
		,max(case when pokemon_stats.stat_id = 2 then base_stat end) as attack
		,max(case when pokemon_stats.stat_id = 3 then base_stat end) as defense
		,max(case when pokemon_stats.stat_id = 4 then base_stat end) as special_attack
		,max(case when pokemon_stats.stat_id = 5 then base_stat end) as special_defense
		,max(case when pokemon_stats.stat_id = 6 then base_stat end) as speed
	from (
		select
			s1.*
			,max(case when pokemon_types.slot = 1 then pokemon_types.type_id end) as first_type_id
			,max(case when pokemon_types.slot = 2 then pokemon_types.type_id end) as second_type_id
		from
		(
			select
				pokemon.id
				,pokemon.height
				,pokemon.weight
				,pokemon.base_experience
				,pokemon_species.id as species_id
				,pokemon.identifier
				,pokemon_species.identifier as species_identifier
				,pokemon_species.gender_rate
				,pokemon.is_default
				,max(case when pokemon_species_names.local_language_id = 1 then pokemon_species_names.name end) as name_jp
				,max(case when pokemon_species_names.local_language_id = 9 then pokemon_species_names.name end) as name_en
				,pokemon_moves.pokemon_move_method_id
			from pokemon_moves
			inner join pokemon pokemon_temp
				on pokemon_moves.pokemon_id = pokemon_temp.id
			inner join pokemon_species pokemon_species_temp
				on pokemon_temp.species_id = pokemon_species_temp.id
			inner join pokemon_species
				on pokemon_species_temp.evolution_chain_id = pokemon_species.evolution_chain_id
			inner join pokemon
				on pokemon_species.id = pokemon.species_id
			inner join pokemon_species_names
				on pokemon_species.id = pokemon_species_names.pokemon_species_id
			where pokemon_moves.move_id = ?
				and pokemon_moves.pokemon_move_method_id = 2
				and pokemon_moves.version_group_id =
					(select max(version_group_id) from pokemon_moves pokemon_moves_copy
					where pokemon_moves.pokemon_id = pokemon_moves_copy.pokemon_id)
			group by pokemon.identifier
		) s1
		inner join pokemon_types
			on s1.id = pokemon_types.pokemon_id
		group by s1.identifier
	) s2
	inner join pokemon_stats
		on s2.id = pokemon_stats.pokemon_id
	group by s2.identifier
) s3
inner join pokemon_forms
	on s3.id = pokemon_forms.pokemon_id
	and pokemon_forms.is_default = 1
left join pokemon_form_names
	on pokemon_forms.id = pokemon_form_names.pokemon_form_id
left join my_pokesprite_icons
	on s3.identifier = my_pokesprite_icons.pokemon_identifier
group by s3.identifier
order by pokemon_move_version_group_id desc, s3.id asc