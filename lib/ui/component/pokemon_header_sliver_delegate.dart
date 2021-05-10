import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokeroku/model/pokedex/pokemon.dart';

class PokemonHeaderSliverDelegate extends SliverPersistentHeaderDelegate {
  PokemonHeaderSliverDelegate({
    required Pokemon pokemon,
    required TabBar tabBar,
    required double appBarHeight,
    required double bottomAppBarHeight,
  })   : _pokemon = pokemon,
        _tabBar = tabBar,
        _appBarHeight = appBarHeight,
        _bottomAppBarHeight = bottomAppBarHeight;

  Pokemon _pokemon;
  TabBar _tabBar;

  double _appBarHeight;
  double _bottomAppBarHeight;

  @override
  double get maxExtent => 340;

  @override
  double get minExtent =>
      _appBarHeight + _bottomAppBarHeight; //ステータスバーの高さとか計算した結果

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = max(0.0, 1 - shrinkOffset / (maxExtent - minExtent));
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: maxExtent - shrinkOffset.ceil(),
          decoration: BoxDecoration(
            color: _pokemon.color,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            height: _bottomAppBarHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned(
          // top: 0,
          bottom: 30,
          child: Center(
            child: Opacity(
              opacity: opacity,
              child: Hero(
                tag: _pokemon.identifier,
                child: Image.asset(
                  _pokemon.imageName,
                  isAntiAlias: true,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.none,
                  width: MediaQuery.of(context).size.width,
                  // height: maxExtent,
                ),
              ),
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            _pokemon.fullNameJp,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite_border,
                ),
                onPressed: () => {})
          ],
        ),
        Positioned(
          left: 0,
          bottom: 0,
          height: _bottomAppBarHeight - 20,
          width: MediaQuery.of(context).size.width,
          child: _tabBar,
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
