import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/move_selection_param.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/ability_detail/ability_detail_page.dart';
import 'package:pokeroku/ui/ability_list/ability_list_page.dart';
import 'package:pokeroku/ui/ability_selection/ability_selection_page.dart';
import 'package:pokeroku/ui/build_edit/build_edit_page.dart';
import 'package:pokeroku/ui/item_selection/item_selection_page.dart';
import 'package:pokeroku/ui/move_detail/move_detail_page.dart';
import 'package:pokeroku/ui/move_list/move_list_page.dart';
import 'package:pokeroku/ui/move_selection/move_selection_page.dart';
import 'package:pokeroku/ui/nature_selection/nature_selection_page.dart';
import 'package:pokeroku/ui/pokemon_list/pokemon_list_page.dart';
import 'package:pokeroku/ui/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokeroku/ui/pokemon_selection/pokemon_selection_page.dart';
import 'package:pokeroku/ui/sign_in/sign_in_page.dart';
import 'package:pokeroku/ui/team_edit/team_edit_page.dart';
import 'package:pokeroku/ui/team_list/team_list_page.dart';

final hideNavigationBarProvider = StateProvider<bool>((ref) => false);

class NavigationPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideNavigationBar = ref.watch(hideNavigationBarProvider);

    // NOTE: This widget includes SCAFFOLD (based on CupertinoTabScaffold), so no need to declare it.
    return PersistentTabView(
      context,
      navBarHeight: 50,
      hideNavigationBar: hideNavigationBar,
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
      screens: [
        PokemonListPage(),
        MoveListPage(),
        AbilityListPage(),
        TeamListPage()
      ],
      items: [
        _buildBottomNavBarItem(context,
            icon: Icon(Icons.bar_chart), title: '?????????'),
        _buildBottomNavBarItem(context, icon: Icon(Icons.album), title: '??????'),
        _buildBottomNavBarItem(context,
            icon: Icon(Icons.psychology), title: '????????????'),
        _buildBottomNavBarItem(context, icon: Icon(Icons.build), title: '????????????'),
      ],
      navBarStyle: NavBarStyle.style6,
      decoration: NavBarDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Theme.of(context).cardColor),
        ),
      ),
    );
  }

  PersistentBottomNavBarItem _buildBottomNavBarItem(BuildContext context,
      {required Widget icon, String? title}) {
    return PersistentBottomNavBarItem(
      icon: icon,
      title: title,
      iconSize: 20,
      textStyle: TextStyle(fontSize: 8),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Theme.of(context).hintColor,
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    bool isFullscreen = false;
    final arguments = settings.arguments;
    final Widget page;
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
        isFullscreen = true;
        break;
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
      case Routes.signIn:
        page = SignInPage();
        isFullscreen = true;
        break;
      case Routes.moveList:
        page = MoveListPage();
        break;
      case Routes.abilityList:
        page = AbilityListPage();
        break;
      default:
        page = PokemonListPage();
    }
    return MaterialPageRoute(
        builder: (context) => page, fullscreenDialog: isFullscreen);
  }
}
