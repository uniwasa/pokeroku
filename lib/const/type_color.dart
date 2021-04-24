import 'package:flutter/material.dart';

enum PokemonType {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
}

extension PokemonTypeExtension on PokemonType {
  String get toShortString => this.toString().split('.').last;

  static PokemonType init(String rawValue) {
    final type = PokemonType.values.firstWhere(
      (element) =>
          element.toShortString.toLowerCase() == rawValue.toLowerCase(),
      orElse: () => PokemonType.unknown,
    );
    return type;
  }

  Color get color {
    switch (this) {
      case PokemonType.normal:
        return TypeColor.normal.color;
      case PokemonType.fighting:
        return TypeColor.fighting.color;
      case PokemonType.flying:
        return TypeColor.flying.color;
      case PokemonType.poison:
        return TypeColor.poison.color;
      case PokemonType.ground:
        return TypeColor.ground.color;
      case PokemonType.rock:
        return TypeColor.rock.color;
      case PokemonType.bug:
        return TypeColor.bug.color;
      case PokemonType.ghost:
        return TypeColor.ghost.color;
      case PokemonType.steel:
        return TypeColor.steel.color;
      case PokemonType.fire:
        return TypeColor.fire.color;
      case PokemonType.water:
        return TypeColor.water.color;
      case PokemonType.grass:
        return TypeColor.grass.color;
      case PokemonType.electric:
        return TypeColor.electric.color;
      case PokemonType.psychic:
        return TypeColor.psychic.color;
      case PokemonType.ice:
        return TypeColor.ice.color;
      case PokemonType.dragon:
        return TypeColor.dragon.color;
      case PokemonType.dark:
        return TypeColor.dark.color;
      case PokemonType.fairy:
        return TypeColor.fairy.color;
      case PokemonType.unknown:
        return TypeColor.unknown.color;
      default:
        return TypeColor.unknown.color;
    }
  }
}

enum TypeColor {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
}

extension TypeColorExtension on TypeColor {
  Color get color {
    switch (this) {
      case TypeColor.normal:
        return Color(0xFFA8A878);
      case TypeColor.fighting:
        return Color(0xFFC03028);
      case TypeColor.flying:
        return Color(0xFFA890F0);
      case TypeColor.poison:
        return Color(0xFFA040A0);
      case TypeColor.ground:
        return Color(0xFFE0C068);
      case TypeColor.rock:
        return Color(0xFFB8A038);
      case TypeColor.bug:
        return Color(0xFFA8B820);
      case TypeColor.ghost:
        return Color(0xFF705898);
      case TypeColor.steel:
        return Color(0xFFB8B8D0);
      case TypeColor.fire:
        return Color(0xFFF08030);
      case TypeColor.water:
        return Color(0xFF6890F0);
      case TypeColor.grass:
        return Color(0xFF78C850);
      case TypeColor.electric:
        return Color(0xFFF8D030);
      case TypeColor.psychic:
        return Color(0xFFF85888);
      case TypeColor.ice:
        return Color(0xFF98D8D8);
      case TypeColor.dragon:
        return Color(0xFF7038F8);
      case TypeColor.dark:
        return Color(0xFF705848);
      case TypeColor.fairy:
        return Color(0xFFEE99AC);
      case TypeColor.unknown:
        return Color(0xFF555555);
      default:
        return Color(0xFF555555);
    }
  }
}
