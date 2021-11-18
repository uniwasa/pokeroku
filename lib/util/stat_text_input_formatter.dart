import 'package:pokeroku/mixin/validation_mixin.dart';
import 'package:flutter/services.dart';

class StatTextInputFormatter extends TextInputFormatter with ValidationMixin {
  StatTextInputFormatter({required int min, required int max})
      : _min = min,
        _max = max;

  final int _min;
  final int _max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '' || int.parse(newValue.text) < _min)
      return TextEditingValue().copyWith(
          selection: TextSelection.collapsed(offset: _min.toString().length),
          text: _min.toString());

    final newInt = int.parse(newValue.text);
    final oldInt = isNumeric(oldValue.text) ? int.parse(oldValue.text) : _min;

    return newInt > _max
        ? TextEditingValue().copyWith(
            selection:
                TextSelection.collapsed(offset: oldInt.toString().length),
            text: oldInt.toString())
        : TextEditingValue().copyWith(
            selection:
                TextSelection.collapsed(offset: newInt.toString().length),
            text: newInt.toString());
  }
}
