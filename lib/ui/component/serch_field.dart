import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key, required ValueChanged<String> callback})
      : _callback = callback,
        super(key: key);

  final ValueChanged<String> _callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (text) {
            _callback(text);
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Theme.of(context).hintColor),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            fillColor: Colors.black,
            filled: true,
          ),
        ),
      ),
    );
  }
}
