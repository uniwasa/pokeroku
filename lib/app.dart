import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/pokedex/pokedex_page.dart';
import 'package:pokeroku/ui/pokeinfo/pokeinfo_page.dart';

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
        // Routes.pokeinfo: (BuildContext context) => PokeinfoPage(),
      },
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;
        switch (settings.name) {
          case Routes.pokeinfo:
            if (arguments is Pokemon) {
              return MaterialPageRoute(
                builder: (context) => PokeinfoPage(pokemon: arguments),
              );
            } else {
              return null;
            }
          default:
            return null;
        }
      },
    );
  }
}
