import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokeinfo_state.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/util.dart';

class PokeinfoViewModel extends StateNotifier<PokeinfoState> {
  PokeinfoViewModel({
    required PokedexDataSource dataSource,
    required AsyncValue<List<Pokemon>> allPokemons,
    required Pokemon pokemon,
  })  : _dataSource = dataSource,
        _allPokemons = allPokemons,
        super(PokeinfoState(
            pokemonBase: pokemon, asyncPokemonEx: AsyncValue.loading())) {
    //ポケモン一覧が読み込まれてるときのみ実行
    _allPokemons.whenData((data) => fetchExtraInfo(data));
  }

  final PokedexDataSource _dataSource;
  final AsyncValue<List<Pokemon>> _allPokemons;

  Future<void> setPokemon(Pokemon pokemon) async {
    state = state.copyWith(
        pokemonBase: pokemon, asyncPokemonEx: AsyncValue.loading());
    _allPokemons.whenData((data) => fetchExtraInfo(data));
  }

  Future<void> fetchExtraInfo(List<Pokemon> allPokemons) async {
    try {
      final pokemonId = state.pokemonBase.id;
      final extraInfo = await _dataSource.getPokemonExtraInfo(pokemonId);
      final String flavorTextJp = extraInfo['flavor_text_jp'] as String;

      //進化取得
      final evolutions = await fetchEvolutions(allPokemons, pokemonId);
      final genderRate = makeGenderRatio(extraInfo['gender_rate']);

      final pokemonEx = PokemonEx(
          base: state.pokemonBase,
          flavorTextJp: flavorTextJp,
          evolutions: evolutions,
          genderRatio: genderRate);

      state = state.copyWith(asyncPokemonEx: AsyncValue.data(pokemonEx));
    } on Exception catch (error) {
      state = state.copyWith(asyncPokemonEx: AsyncValue.error(error));
    }
  }

  Future<List<List<Pokemon>>> fetchEvolutions(
      List<Pokemon> allPokemons, int pokemonId) async {
    final evolutions = await _dataSource.getEvolutions(pokemonId);
    final firstStage = evolutions
        .where((element) => element['evolves_from_species_id'] == null)
        .toList();
    final secondStage = getNextStage(evolutions, firstStage);
    final thirdStage = getNextStage(evolutions, secondStage);
    //空でないステージのみ代入
    final stages = [firstStage, secondStage, thirdStage]
        .where((stage) => stage.isNotEmpty);

    final result = stages.map((stage) {
      return stage.map((pokemonMap) {
        return allPokemons.firstWhere((pokemon) {
          return pokemon.id == pokemonMap['id'];
        });
      }).toList();
    }).toList();
    return (result);
  }

  List<Map<String, dynamic>> getNextStage(
    List<Map<String, dynamic>> evolutions,
    List<Map<String, dynamic>> preStage,
  ) {
    return evolutions.where((element) {
      return preStage
          .map((e) => e['species_id'])
          .toList()
          .contains(element['evolves_from_species_id']);
    }).toList();
  }
}
