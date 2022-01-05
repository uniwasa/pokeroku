import 'package:flutter/material.dart';

class PixelImage extends StatelessWidget {
  PixelImage(String name, {Key? key, double? width})
      : _name = name,
        _width = width,
        super(key: key);

  final String _name;
  final double? _width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _name,
      isAntiAlias: true,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.none,
      width: _width,
    );
  }
}
