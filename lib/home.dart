import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/move_selection_param.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/ability_detail/ability_detail_page.dart';
import 'package:pokeroku/ui/ability_selection/ability_selection_page.dart';
import 'package:pokeroku/ui/build_edit/build_edit_page.dart';
import 'package:pokeroku/ui/item_selection/item_selection_page.dart';
import 'package:pokeroku/ui/move_detail/move_detail_page.dart';
import 'package:pokeroku/ui/move_selection/move_selection_page.dart';
import 'package:pokeroku/ui/nature_selection/nature_selection_page.dart';
import 'package:pokeroku/ui/pokemon_list/pokemon_list_page.dart';
import 'package:pokeroku/ui/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokeroku/ui/pokemon_selection/pokemon_selection_page.dart';
import 'package:pokeroku/ui/team_edit/team_edit_page.dart';
import 'package:pokeroku/ui/team_list/team_list_page.dart';
import 'package:pokeroku/ui/user_edit/user_edit_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      screens: [PokemonListPage(), TeamListPage()],
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
      case Routes.pokemonDetail:
        page = PokemonDetailPage(pokemon: arguments as Pokemon);
        break;
      case Routes.abilityDetail:
        page = AbilityDetailPage(ability: arguments as Ability);
        break;
      case Routes.moveDetail:
        page = MoveDetailPage(move: arguments as Move);
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
        page = BuildEditPage(buildEditParam: arguments as BuildEditParam);
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
      case Routes.itemSelection:
        page = ItemSelectionPage(buildEditParam: arguments as BuildEditParam);
        break;
      case Routes.abilitySelection:
        page =
            AbilitySelectionPage(buildEditParam: arguments as BuildEditParam);
        break;
      case Routes.natureSelection:
        page = NatureSelectionPage(buildEditParam: arguments as BuildEditParam);
        break;
      case Routes.moveSelection:
        page = MoveSelectionPage(
            moveSelectionParam: arguments as MoveSelectionParam);
        break;
      case Routes.userEdit:
        page = UserEditPage();
        break;
      default:
        page = PokemonListPage();
    }
    return MaterialPageRoute(builder: (context) => page);
  }
}
