import 'package:pokeroku/model/pokemon.dart';

abstract class BuildManager {
  Future<void> addBuild({required Pokemon pokemon});
}
