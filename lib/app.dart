import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/home.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pokeroku',
      theme: ThemeData.dark(),
      initialRoute: Routes.home,
      routes: <String, WidgetBuilder>{
        Routes.home: (BuildContext context) => Home(),
      },
    );
  }
}
