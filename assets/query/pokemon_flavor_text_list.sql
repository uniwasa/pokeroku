select
	pokemon_species_flavor_text.version_id
	,max(case when  pokemon_species_flavor_text.language_id = 11 then pokemon_species_flavor_text.flavor_text else '' end) as flavor_text_jp
	,max(case when  pokemon_species_flavor_text.language_id = 9 then pokemon_species_flavor_text.flavor_text else '' end) as flavor_text_en
from pokemon
inner join pokemon_species
	on pokemon.species_id = pokemon_species.id
inner join pokemon_species_flavor_text
	on pokemon_species_flavor_text.species_id = pokemon_species.id
where pokemon.id = ?
group by version_id
order by version_id