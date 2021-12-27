import 'package:flutter/material.dart';

class ListGroup extends StatelessWidget {
  ListGroup({Key? key, required List<Widget> children})
      : _children = children,
        super(key: key);

  final List<Widget> _children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          color: Theme.of(context).hoverColor,
          child: Column(
            children: _children,
          ),
        ),
      ),
    );
  }
}
