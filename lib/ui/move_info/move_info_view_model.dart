import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/move_info_state.dart';
import 'package:pokeroku/model/pokemon.dart';

class MoveInfoViewModel extends StateNotifier<MoveInfoState> {
  MoveInfoViewModel({
    required Move move,
    required AsyncValue<List<Pokemon>> asyncPokemonList,
  }) : super(MoveInfoState(move: move, asyncPokemonList: asyncPokemonList)) {
    init();
  }

  Future<void> init() async {}
}
