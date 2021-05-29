import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/provider/current_pokemon_provider.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/provider/all_pokemons_provider.dart';
import 'package:pokeroku/util.dart';

final pokeinfoViewModelProvider =
    StateNotifierProvider<PokeinfoViewModel, AsyncValue<PokemonEx>>((ref) {
  return PokeinfoViewModel(
    dataSource: ref.read(pokedexDataSourceProvider),
    currentPokemon: ref.watch(currentPokemonProvider),
    allPokemons: ref.watch(allPokemonsProvider),
  );
});

class PokeinfoViewModel extends StateNotifier<AsyncValue<PokemonEx>> {
  PokeinfoViewModel({
    required PokedexDataSource dataSource,
    required Pokemon? currentPokemon,
    required AsyncValue<List<Pokemon>> allPokemons,
  })  : _dataSource = dataSource,
        _currentPokemon = currentPokemon,
        _allPokemons = allPokemons,
        super(const AsyncValue.loading()) {
    //ポケモン一覧が読み込まれてるときのみ実行
    _allPokemons.whenData((data) => fetchExtraInfo(data));
  }

  final PokedexDataSource _dataSource;
  final Pokemon? _currentPokemon;
  final AsyncValue<List<Pokemon>> _allPokemons;

  Future<void> fetchExtraInfo(List<Pokemon> allPokemons) async {
    try {
      final currentPokemon = _currentPokemon;
      if (currentPokemon != null) {
        final pokemonId = currentPokemon.id;
        final extraInfo = await _dataSource.getPokemonExtraInfo(pokemonId);
        final String flavorTextJp = extraInfo['flavor_text_jp'] as String;

        //進化取得
        final evolutions = await fetchEvolutions(allPokemons, pokemonId);
        final genderRate = makeGenderRatio(extraInfo['gender_rate']);

        final pokemonEx = PokemonEx(
            base: currentPokemon,
            flavorTextJp: flavorTextJp,
            evolutions: evolutions,
            genderRatio: genderRate);

        state = AsyncValue.data(pokemonEx);
      }
    } on Exception catch (error) {
      state = AsyncValue.error(error);
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

// Pokemon? _pokemon;

// Pokemon? get pokemon => _currentPokemon.pokemon;
}
