import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/pokemon.dart';

abstract class BuildManager {
  Future<void> addBuild({required Pokemon pokemon});
  Future<void> updateBuild({required Build build});
}
