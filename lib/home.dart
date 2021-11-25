import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/build_edit_parameter.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/ability_info/ability_info_page.dart';
import 'package:pokeroku/ui/build_edit/build_edit_page.dart';
import 'package:pokeroku/ui/move_info/move_info_page.dart';
import 'package:pokeroku/ui/pokedex/pokedex_page.dart';
import 'package:pokeroku/ui/pokeinfo/pokeinfo_page.dart';
import 'package:pokeroku/ui/pokemon_selection/pokemon_selection_page.dart';
import 'package:pokeroku/ui/team_edit/team_edit_page.dart';
import 'package:pokeroku/ui/team_list/team_list_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: Theme.of(context).primaryColor,
      screens: [PokedexPage(), TeamListPage()],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.format_list_numbered),
          title: ('ポケモン'),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Theme.of(context).hintColor,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.save),
          title: ('パーティ'),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Theme.of(context).hintColor,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
        ),
      ],
      navBarStyle: NavBarStyle.style1,
    );
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    Widget page;
    switch (settings.name) {
      case Routes.pokeinfo:
        page = PokeinfoPage(pokemon: arguments as Pokemon);
        break;
      case Routes.abilityInfo:
        page = AbilityInfoPage(ability: arguments as Ability);
        break;
      case Routes.moveInfo:
        page = MoveInfoPage(move: arguments as Move);
        break;
      case Routes.teamList:
        page = TeamListPage();
        break;
      case Routes.teamEdit:
        page = TeamEditPage(teamId: arguments as String);
        break;
      case Routes.pokemonSelection:
        page = PokemonSelectionPage(teamId: arguments as String?);
        break;
      case Routes.buildEdit:
        page =
            BuildEditPage(buildEditParameter: arguments as BuildEditParameter);
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeUpwardsPageTransitionsBuilder().buildTransitions(
                  MaterialPageRoute(builder: (context) => page),
                  context,
                  animation,
                  secondaryAnimation,
                  child);
            });
      default:
        page = PokedexPage();
    }
    return MaterialPageRoute(builder: (context) => page);
  }
}
