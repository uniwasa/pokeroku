import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/ui/navigation_page.dart';
import 'package:pokeroku/ui/pokemon_list/pokemon_list_view_model.dart';
import 'package:pokeroku/ui/component/user_drawer.dart';

import '../../routes.dart';
import '../../util.dart';

class PokemonListPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPokemonList = ref.watch(pokemonListViewModelProvider);
    return Scaffold(
      drawer: UserDrawer(),
      onDrawerChanged: (isOpen) {
        ref.watch(hideNavigationBarProvider.notifier).state = isOpen;
      },
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          Container(
            width: kToolbarHeight,
            // child: Icon(Icons.filter_alt),
          ),
        ],
        title: Container(
          height: kToolbarHeight - 16,
          child: TextField(
            onChanged: (text) {
              final provider = ref.read(pokemonListViewModelProvider.notifier);
              provider.searchForText(text);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.white54),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: Colors.black,
              filled: true,
            ),
          ),
        ),
      ),
      body: asyncPokemonList.when(
        data: (pokemonList) {
          return ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (BuildContext context, int index) {
              final pokemon = pokemonList[index];
              // final isPrevGenIcon = pokemon.gen8!.forms!['\$']!.isPrevGenIcon!;
              final Image pokemonImage = Image.asset(
                pokemon.imageName,
                isAntiAlias: true,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.none,
              );
              final pokemonHeroImage = Hero(
                tag: pokemon.identifier,
                child: pokemonImage,
              );

              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, Routes.pokemonDetail,
                      arguments: pokemon);
                },
                leading: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: pokemonHeroImage,
                ),
                title: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      pokemon.nameJp,
                    ),
                    if (pokemon.formNameJp != null)
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          pokemon.formNameJp!,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (pokemon.firstType != null)
                      buildCircle(color: pokemon.firstType!.color),
                    if (pokemon.secondType != null)
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: buildCircle(
                          color: pokemon.secondType!.color,
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
