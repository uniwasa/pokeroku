import 'package:flutter/material.dart';

class AbilityInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text('Sample'),
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 100),
                child: Container(
                  height: 100,
                  child: Center(
                    child: Text('description'),
                  ),
                ),
              ),
            )
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  print(index);
                  return Text(index.toString());
                },
                childCount: 100,
              ),
            ),
          ],
        ),

        // SingleChildScrollView(
        //   child: Column(children: [
        //     for (int i = 0; i < 100; i++)
        //       Builder(builder: (BuildContext context) {
        //         print(i);
        //         return Text('hello');
        //       })
        //   ]),
        // )

        // SafeArea(
        //   top: false,
        //   child: ListView.builder(
        //     padding: EdgeInsets.all(0),
        //     itemBuilder: (BuildContext context, int index) {
        //       print(index);
        //       return Text('hello');
        //     },
        //     itemCount: 100,
        //   ),
        // ),
      ),
    );
  }
}
