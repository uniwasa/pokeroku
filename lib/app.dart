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
          .copyWith(backgroundColor: darkTheme.primaryColor),
      scaffoldBackgroundColor: Color.fromRGBO(40, 40, 40, 1),
      cardColor: Color.fromRGBO(52, 52, 52, 1),
      dialogBackgroundColor: Color.fromRGBO(52, 52, 52, 1),
    );
    return customTheme;
  }
}
