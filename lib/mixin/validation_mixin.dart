import 'package:collection/collection.dart';

mixin ValidationMixin {
  bool isNumeric(String? value) {
    if (value == null) return false;
    return double.tryParse(value) != null;
  }

  bool isValidIndividualValue(String? value) {
    if (value != null && isNumeric(value)) {
      final num = int.parse(value);
      if (0 <= num && num <= 31) return true;
    }
    return false;
  }

  bool isValidEffortValue(String? value) {
    if (value != null && isNumeric(value)) {
      final num = int.parse(value);
      if (0 <= num && num <= 252) return true;
    }
    return false;
  }
}
