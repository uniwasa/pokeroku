import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/pokedex/pokedex_page.dart';
import 'package:pokeroku/ui/pokemon/pokemon_page.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: Routes.pokedex,
      routes: <String, WidgetBuilder>{
        Routes.pokedex: (BuildContext context) => PokedexPage(),
        Routes.pokemon: (BuildContext context) => PokemonPage(),
      },
    );
  }
}
