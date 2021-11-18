class StatName {
  static const String hp = 'hp';
  static const String attack = 'attack';
  static const String defense = 'defense';
  static const String specialAttack = 'specialAttack';
  static const String specialDefense = 'specialDefense';
  static const String speed = 'speed';
  static List<String> get list =>
      [hp, attack, defense, specialAttack, specialDefense, speed];
  static List<String> get abbrList => ['hp', 'Atk', 'Def', 'SpA', 'SpD', 'Spe'];
}
