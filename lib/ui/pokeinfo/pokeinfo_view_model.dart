import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/move.dart';
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
          pokemonBase: pokemon,
          asyncPokemonEx: AsyncValue.loading(),
          asyncMoves: AsyncValue.loading(),
        )) {
    fetchExtraInfo();
  }

  final PokedexDataSource _dataSource;
  final AsyncValue<List<Pokemon>> _allPokemons;
  List<Move> allMoves = [];

  Future<void> setPokemon(Pokemon pokemon) async {
    state = state.copyWith(
      pokemonBase: pokemon,
      asyncPokemonEx: AsyncValue.loading(),
      asyncMoves: AsyncValue.loading(),
    );
    fetchExtraInfo();
  }

  Future<void> fetchExtraInfo() async {
    //ポケモン一覧が読み込まれてるときのみ実行
    _allPokemons.whenData((allPokemons) async {
      try {
        final pokemonId = state.pokemonBase.id;
        final extraInfo = await _dataSource.getPokemonExtraInfo(pokemonId);
        final String flavorTextJp = extraInfo['flavor_text_jp'] as String;

        //進化取得
        final evolutions = await fetchEvolutions(allPokemons, pokemonId);
        final genderRate = makeGenderRatio(extraInfo['gender_rate']);

        final abilities = await fetchAbilities(pokemonId);

        final pokemonEx = PokemonEx(
          base: state.pokemonBase,
          flavorTextJp: flavorTextJp,
          evolutions: evolutions,
          genderRatio: genderRate,
          abilities: abilities,
        );
        state = state.copyWith(asyncPokemonEx: AsyncValue.data(pokemonEx));

        final moves = await _dataSource.getPokemonMoves(pokemonId);
        allMoves = moves;
        state = state.copyWith(asyncMoves: AsyncValue.data(moves));
      } on Exception catch (error) {
        state = state.copyWith(
          asyncPokemonEx: AsyncValue.error(error),
          asyncMoves: AsyncValue.error(error),
        );
      }
    });
  }

  Future<List<Ability>> fetchAbilities(int pokemonId) async {
    final abilities = await _dataSource.getPokemonAbilities(pokemonId);
    final result = abilities.map((e) => Ability.fromJson(e)).toList();
    return result;
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

  void searchForMoves(String input) {
    final filtered = allMoves.where((move) {
      return hiraToKana(move.nameJp).contains(hiraToKana(input));
    }).toList();
    state = state.copyWith(asyncMoves: AsyncValue.data(filtered));
  }
}
