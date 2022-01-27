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
    final mainColor = Color.fromRGBO(16, 16, 16, 1);
    final customTheme = darkTheme.copyWith(
      appBarTheme: darkTheme.appBarTheme.copyWith(
        backgroundColor: mainColor,
        elevation: 0,
      ),
      scaffoldBackgroundColor: mainColor,
      cardColor: Color.fromRGBO(24, 24, 24, 1),
      dialogBackgroundColor: Color.fromRGBO(24, 24, 24, 1),
    );
    return customTheme;
  }
}
