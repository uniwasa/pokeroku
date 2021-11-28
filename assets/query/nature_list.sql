select
	natures.*
	,max(case when nature_names.local_language_id = 1 then nature_names.name end) as name_jp
	,max(case when natures.decreased_stat_id= stats.id then stats.identifier end) as decreased_stat_identifier
	,max(case when natures.increased_stat_id= stats.id then stats.identifier end) as increased_stat_identifier
from natures
inner join stats
	on natures.decreased_stat_id = stats.id
	or natures.increased_stat_id = stats.id
inner join nature_names
	on natures.id = nature_names.nature_id
group by natures.id
