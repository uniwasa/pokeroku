bool intToBool(int a) => a == 0 ? false : true;

String hiraToKana(String str) {
  return str.replaceAllMapped(new RegExp("[ぁ-ゔ]"),
      (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 0x60));
}

String kanaToHira(String str) {
  return str.replaceAllMapped(new RegExp("[ァ-ヴ]"),
      (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) - 0x60));
}
