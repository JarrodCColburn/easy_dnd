import 'package:easy_dnd/animations/draw_in_effect.dart';
import 'package:easy_dnd/cards/card_1.dart';
import 'package:easy_dnd/cards/card_2.dart';
import 'package:easy_dnd/cards/card_3.dart';
import 'package:easy_dnd/cards/card_4.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy DND'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(15.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: <Widget>[
          DrawIn(child: CardOne()),
          DrawIn(child: CardTwo()),
          DrawIn(child: CardThree()),
          DrawIn(child: CardFour()),
          Example(
            text: 'MEDIA ON',
            color: Color.fromARGB(255, 63, 81, 181),
          ),
          Example(
            text: 'NOTIFICATIONS ON',
            color: Color.fromARGB(255, 156, 39, 176),
          ),
          Example(
            text: 'Example 7',
            color: Color.fromARGB(255, 233, 30, 99),
          ),
          Example(
            text: 'ADVANCED SETTINGS',
            color: Color.fromARGB(255, 121, 85, 72),
          ),
        ],
      ),
    );
  }
}

class Example extends StatelessWidget {
  Example({@required this.text, this.color = Colors.white});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 5.0,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
