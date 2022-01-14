import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {Key? key,
      required Widget child,
      required VoidCallback? onPressed,
      Color? color})
      : _child = child,
        _onPressed = onPressed,
        _color = color,
        super(key: key);

  final Widget _child;
  final VoidCallback? _onPressed;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: _child,
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        primary: _color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
