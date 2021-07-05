import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/ability_info/ability_info_page.dart';
import 'package:pokeroku/ui/move_info/move_info_page.dart';
import 'package:pokeroku/ui/pokedex/pokedex_page.dart';
import 'package:pokeroku/ui/pokeinfo/pokeinfo_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: Theme.of(context).primaryColor,
      screens: [PokedexPage(), PokedexPage()],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.format_list_numbered),
          title: ('ポケモン'),
          activeColorPrimary: Theme.of(context).accentColor,
          inactiveColorPrimary: Theme.of(context).hintColor,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.save),
          title: ('パーティ'),
          activeColorPrimary: Theme.of(context).accentColor,
          inactiveColorPrimary: Theme.of(context).hintColor,
        ),
      ],
      navBarStyle: NavBarStyle.style1,
    );
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
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
      case Routes.abilityInfo:
        if (arguments is Ability) {
          return MaterialPageRoute(
            builder: (context) => AbilityInfoPage(ability: arguments),
          );
        } else {
          return null;
        }
      case Routes.moveInfo:
        if (arguments is Move) {
          return MaterialPageRoute(
            builder: (context) => MoveInfoPage(move: arguments),
          );
        } else {
          return null;
        }
      default:
        return null;
    }
  }
}
