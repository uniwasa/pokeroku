select
	pokemon.id
	,pokemon_species.id as species_id
	,pokemon_species.gender_rate
	,max(case when pokemon_species_flavor_text.language_id = 11 then pokemon_species_flavor_text.flavor_text end) as flavor_text_jp
from pokemon
inner join pokemon_species
	on pokemon.species_id = pokemon_species.id
inner join pokemon_species_flavor_text
	on pokemon_species_flavor_text.species_id = pokemon_species.id
	and pokemon_species_flavor_text.version_id = 
		(select max(version_id) from pokemon_species_flavor_text flavor 
		where pokemon_species_flavor_text.species_id = flavor.species_id
		and flavor.flavor_text != '')
where pokemon.id = ?
group by pokemon.id