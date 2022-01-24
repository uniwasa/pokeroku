import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/ability_list/ability_list_view_model.dart';
import 'package:pokeroku/ui/navigation_page.dart';
import 'package:pokeroku/ui/component/user_drawer.dart';

class AbilityListPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAbilityList = ref.watch(abilityListViewModelProvider);
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
              final provider = ref.read(abilityListViewModelProvider.notifier);
              provider.searchForText(text);
            },
            decoration: InputDecoration(
              hintText: 'とくせい名',
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
      body: asyncAbilityList.when(
        data: (abilityList) {
          return ListView.builder(
            itemCount: abilityList.length,
            itemBuilder: (BuildContext context, int index) {
              final ability = abilityList[index];
              return ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(ability.nameJp),
                      flex: 4,
                    ),
                    Expanded(
                      child: Text(
                        ability.flavorTextJp.replaceAll(RegExp(r'\n'), ''),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 12, color: Theme.of(context).hintColor),
                      ),
                      flex: 6,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.abilityDetail,
                    arguments: ability,
                  );
                },
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
