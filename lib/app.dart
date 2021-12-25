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
      theme: _customDarkTheme(),
      initialRoute: Routes.home,
      routes: <String, WidgetBuilder>{
        Routes.home: (BuildContext context) => Home(),
      },
    );
  }

  ThemeData _customDarkTheme() {
    final darkTheme = ThemeData.dark();
    final customTheme = darkTheme.copyWith(
      appBarTheme: darkTheme.appBarTheme
          .copyWith(backgroundColor: Color.fromRGBO(28, 28, 28, 1)),
      scaffoldBackgroundColor: Color.fromRGBO(24, 24, 24, 1),
      cardColor: Color.fromRGBO(32, 32, 32, 1),
      dialogBackgroundColor: Color.fromRGBO(32, 32, 32, 1),
    );
    return customTheme;
  }
}
