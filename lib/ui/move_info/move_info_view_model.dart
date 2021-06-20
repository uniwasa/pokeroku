import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/move_info_state.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

class MoveInfoViewModel extends StateNotifier<MoveInfoState> {
  MoveInfoViewModel({
    required PokedexDataSource dataSource,
    required Move move,
  })  : _dataSource = dataSource,
        super(MoveInfoState(move: move, asyncPokemons: AsyncValue.loading())) {
    fetchPokemons();
  }

  final PokedexDataSource _dataSource;

  Future<void> setMove(Move move) async {
    state = state.copyWith(move: move, asyncPokemons: AsyncValue.loading());
    fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    try {
      final moveId = state.move.id;
      final pokemons = await _dataSource.getMovePokemons(moveId);
      state = state.copyWith(asyncPokemons: AsyncValue.data(pokemons));
    } on Exception catch (error) {
      state = state.copyWith(asyncPokemons: AsyncValue.error(error));
    }
  }
}
