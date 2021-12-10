import 'package:flutter/material.dart';

class EmptyScrollView extends StatelessWidget {
  EmptyScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(child: Text('登録がありません')),
        ),
      ),
    );
  }
}
