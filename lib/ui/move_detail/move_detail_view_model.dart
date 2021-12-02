import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/move_detail_state.dart';
import 'package:pokeroku/model/pokemon.dart';

class MoveDetailViewModel extends StateNotifier<MoveDetailState> {
  MoveDetailViewModel({
    required Move move,
    required AsyncValue<List<Pokemon>> asyncPokemonList,
  }) : super(MoveDetailState(move: move, asyncPokemonList: asyncPokemonList)) {
    init();
  }

  Future<void> init() async {}
}
