mixin ValidationMixin {
  bool isNumeric(String? value) {
    if (value == null) return false;
    return double.tryParse(value) != null;
  }
}
