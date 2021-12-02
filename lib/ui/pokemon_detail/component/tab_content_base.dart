part of '../pokemon_detail_page.dart';

extension TabContentBase on PokemonDetailPage {
  List<Widget> buildTabContentBase(
      {required BuildContext context,
      required PokemonEx pokemonEx,
      required PokemonDetailState pokemonDetailState}) {
    return [
      SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, top: 4, right: 12, bottom: 12),
                  child: Center(
                    child: Builder(builder: (context) {
                      final flavorTextList = pokemonDetailState
                          .asyncPokemonFlavorTextList.data?.value;
                      final flavorText = flavorTextList!.lastWhereOrNull(
                          (element) => element.flavorTextJp != '');
                      return Text(
                        flavorText?.flavorTextJp
                                .replaceAll(RegExp(r'\n'), '') ??
                            '',
                        style: TextStyle(
                          height: 2,
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          pokemonEx.base.height.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'm',
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          pokemonEx.base.weight.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'kg',
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: pokemonEx.base.genderRate != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          color: Colors.lightBlue,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              pokemonEx.base.genderRate!.first.toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '%',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.female,
                          color: Colors.pinkAccent,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              pokemonEx.base.genderRate!.last.toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '%',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Text('性別ふめい'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeaderLabel(
                      color: pokemonEx.base.firstType?.color ?? Colors.grey,
                      text: '特性'),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: pokemonEx.abilities
                          .map((ability) => Container(
                                width: double.infinity,
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.abilityDetail,
                                        arguments: ability,
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          right: 10,
                                          bottom: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                ability.nameJp,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              if (ability.isHidden)
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: Text(
                                                    '夢特性',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                )
                                            ],
                                          ),
                                          Text(
                                            ability.flavorTextJp.replaceAll(
                                                    RegExp(r'\n'), '') +
                                                '\n', // 末尾に改行いれて擬似的にminLines実現
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            PokemonEvolutionChain(pokemonEx: pokemonEx),
          ],
        ),
      )
    ];
  }
}
