select
	pokemon.*
	,pokemon_species.evolves_from_species_id
	,pokemon_form_names.form_name
from pokemon pokemon_temp
inner join pokemon_species pokemon_species_temp
	on pokemon_temp.species_id = pokemon_species_temp.id
inner join pokemon_species
	on pokemon_species_temp.evolution_chain_id = pokemon_species.evolution_chain_id
inner join pokemon
	on pokemon.species_id = pokemon_species.id
inner join pokemon_forms
	on pokemon.id = pokemon_forms.pokemon_id
	and pokemon_forms.is_default = 1
left join pokemon_form_names
	on pokemon_forms.id = pokemon_form_names.pokemon_form_id
	and pokemon_form_names.local_language_id = 9
where pokemon_temp.id = ?
and (
	pokemon.is_default = 1
	or pokemon_form_names.form_name = 'Galarian Form'
	or pokemon_form_names.form_name = 'Alolan Form'
	)
order by species_id, id