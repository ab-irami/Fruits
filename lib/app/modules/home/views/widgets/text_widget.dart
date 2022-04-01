
import 'package:flutter/material.dart';
import 'package:fruits/constants.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.name,
    this.title,
  }) : super(key: key);

  final String? name;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: TextStyle(
              color: grey,
              fontSize: 16,
            ),
          ),
          Text(
            title!,
            style: TextStyle(
              fontSize: 10,
              color: lightGrey,
            ),
          )
        ],
      ),
    );
  }
}
