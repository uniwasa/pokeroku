import 'package:flutter/material.dart';

enum PokemonTypeEnum {
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

extension PokemonTypeExtension on PokemonTypeEnum {
  String get toShortString => this.toString().split('.').last;

  static PokemonTypeEnum init(String rawValue) {
    final type = PokemonTypeEnum.values.firstWhere(
      (element) =>
          element.toShortString.toLowerCase() == rawValue.toLowerCase(),
      orElse: () => PokemonTypeEnum.unknown,
    );
    return type;
  }

  Color get color {
    switch (this) {
      case PokemonTypeEnum.normal:
        return TypeColorEnum.normal.color;
      case PokemonTypeEnum.fighting:
        return TypeColorEnum.fighting.color;
      case PokemonTypeEnum.flying:
        return TypeColorEnum.flying.color;
      case PokemonTypeEnum.poison:
        return TypeColorEnum.poison.color;
      case PokemonTypeEnum.ground:
        return TypeColorEnum.ground.color;
      case PokemonTypeEnum.rock:
        return TypeColorEnum.rock.color;
      case PokemonTypeEnum.bug:
        return TypeColorEnum.bug.color;
      case PokemonTypeEnum.ghost:
        return TypeColorEnum.ghost.color;
      case PokemonTypeEnum.steel:
        return TypeColorEnum.steel.color;
      case PokemonTypeEnum.fire:
        return TypeColorEnum.fire.color;
      case PokemonTypeEnum.water:
        return TypeColorEnum.water.color;
      case PokemonTypeEnum.grass:
        return TypeColorEnum.grass.color;
      case PokemonTypeEnum.electric:
        return TypeColorEnum.electric.color;
      case PokemonTypeEnum.psychic:
        return TypeColorEnum.psychic.color;
      case PokemonTypeEnum.ice:
        return TypeColorEnum.ice.color;
      case PokemonTypeEnum.dragon:
        return TypeColorEnum.dragon.color;
      case PokemonTypeEnum.dark:
        return TypeColorEnum.dark.color;
      case PokemonTypeEnum.fairy:
        return TypeColorEnum.fairy.color;
      case PokemonTypeEnum.unknown:
        return TypeColorEnum.unknown.color;
      default:
        return TypeColorEnum.unknown.color;
    }
  }
}

enum TypeColorEnum {
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

extension TypeColorExtension on TypeColorEnum {
  Color get color {
    switch (this) {
      case TypeColorEnum.normal:
        return Color(0xFFA8A878);
      case TypeColorEnum.fighting:
        return Color(0xFFC03028);
      case TypeColorEnum.flying:
        return Color(0xFFA890F0);
      case TypeColorEnum.poison:
        return Color(0xFFA040A0);
      case TypeColorEnum.ground:
        return Color(0xFFE0C068);
      case TypeColorEnum.rock:
        return Color(0xFFB8A038);
      case TypeColorEnum.bug:
        return Color(0xFFA8B820);
      case TypeColorEnum.ghost:
        return Color(0xFF705898);
      case TypeColorEnum.steel:
        return Color(0xFFB8B8D0);
      case TypeColorEnum.fire:
        return Color(0xFFF08030);
      case TypeColorEnum.water:
        return Color(0xFF6890F0);
      case TypeColorEnum.grass:
        return Color(0xFF78C850);
      case TypeColorEnum.electric:
        return Color(0xFFF8D030);
      case TypeColorEnum.psychic:
        return Color(0xFFF85888);
      case TypeColorEnum.ice:
        return Color(0xFF98D8D8);
      case TypeColorEnum.dragon:
        return Color(0xFF7038F8);
      case TypeColorEnum.dark:
        return Color(0xFF705848);
      case TypeColorEnum.fairy:
        return Color(0xFFEE99AC);
      case TypeColorEnum.unknown:
        return Color(0xFF555555);
      default:
        return Color(0xFF555555);
    }
  }
}
