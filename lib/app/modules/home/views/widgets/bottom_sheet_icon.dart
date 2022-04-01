import 'package:flutter/material.dart';
import 'package:fruits/constants.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key, this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$text'),
      trailing: Wrap(
        spacing: 12,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: () {},
            hoverColor: green,
          ),
          IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: () {},
            hoverColor: green,
          ),
        ],
      ),
    );
  }
}