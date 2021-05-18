import 'package:flutter/material.dart';

bool intToBool(int a) => a == 0 ? false : true;

String hiraToKana(String str) {
  return str.replaceAllMapped(new RegExp("[ぁ-ゔ]"),
      (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 0x60));
}

String kanaToHira(String str) {
  return str.replaceAllMapped(new RegExp("[ァ-ヴ]"),
      (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) - 0x60));
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

Widget buildBadge({required String text, required Color color}) {
  return Container(
    width: 80,
    decoration: new BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: text
              .split('')
              .map(
                (string) => Text(
                  string,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ),
  );
}

Widget buildCircle({required Color color}) {
  return Container(
    width: 15,
    height: 15,
    decoration: new BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
  );
}
