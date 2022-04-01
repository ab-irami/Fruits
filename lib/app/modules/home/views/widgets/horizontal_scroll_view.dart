import 'package:flutter/material.dart';

class HoriZontalScrollView extends StatelessWidget {
  const HoriZontalScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            children: [
              Image.asset('assets/images/apple.png'),
              Text('Apples'),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              Image.asset('assets/images/grapes.png'),
              Text('Grapes'),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              Image.asset('assets/images/lemon.png'),
              Text('Lemons'),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              Image.asset('assets/images/mango.png'),
              Text('Mangos'),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              Image.asset('assets/images/watermelon.png'),
              Text('Watermelons'),
            ],
          ),
        ],
      ),
    );
  }
}
