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

Widget buildBadge({
  required String text,
  required Color color,
  bool? isSquare,
  double fontSize = 12,
  double? height,
  double width = 80,
}) {
  return Container(
    height: height,
    width: width,
    decoration: new BoxDecoration(
      color: color,
      borderRadius: isSquare == true
          ? BorderRadius.all(Radius.circular(5))
          : BorderRadius.all(Radius.circular(100)),
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
                    fontSize: fontSize,
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

Widget buildHeaderLabel({required Color color, required String text}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, bottom: 2),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

List<double>? makeGenderRate(int value) {
  if (value >= 0 && value <= 8) {
    final double femaleRate = value / 8 * 100;
    final double maleRate = 100 - femaleRate;
    return [maleRate, femaleRate];
  }
}

double makeOneTenth(int value) {
  return value / 10;
}
