import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/component/move_list_tile.dart';
import 'package:pokeroku/ui/move_list/move_list_view_model.dart';
import 'package:pokeroku/ui/navigation_page.dart';
import 'package:pokeroku/ui/component/user_drawer.dart';

class MoveListPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMoveList = ref.watch(moveListViewModelProvider);
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
              final provider = ref.read(moveListViewModelProvider.notifier);
              provider.searchForText(text);
            },
            decoration: InputDecoration(
              hintText: 'わざ名',
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
      body: asyncMoveList.when(
        data: (moveList) {
          return ListView.builder(
            itemCount: moveList.length,
            itemBuilder: (BuildContext context, int index) {
              final move = moveList[index];
              return MoveListTile(
                move: move,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.moveDetail,
                    arguments: move,
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
