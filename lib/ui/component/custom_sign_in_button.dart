import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSignInButton extends StatelessWidget {
  CustomSignInButton({
    Key? key,
    required Widget icon,
    required String labelText,
    required VoidCallback? onPressed,
    Color? color,
    Color? textColor,
  })  : _icon = icon,
        _labelText = labelText,
        _onPressed = onPressed,
        _color = color,
        _textColor = textColor,
        super(key: key);

  final Widget _icon;
  final String _labelText;
  final VoidCallback? _onPressed;
  final Color? _color;
  final Color? _textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints:
            BoxConstraints.tightFor(width: double.infinity, height: 44.0),
        child: ElevatedButton.icon(
          icon: _icon,
          label: Text(_labelText, style: TextStyle(fontSize: 19)),
          style: ElevatedButton.styleFrom(
            primary: _color ?? Colors.white,
            onPrimary: _textColor ?? Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: _onPressed,
        ),
      ),
    );
  }
}
