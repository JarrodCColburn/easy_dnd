import 'package:easy_dnd/animations/draw_in_effect.dart';
import 'package:easy_dnd/cards/gridcard_1.dart';
import 'package:easy_dnd/cards/gridcard_2.dart';
import 'package:easy_dnd/cards/gridcard_3.dart';
import 'package:easy_dnd/cards/gridcard_4.dart';
import 'package:easy_dnd/cards/gridcard_5.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Easy DND'),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(15.0),
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          crossAxisCount: 2,
          children: <Widget>[
            DrawInLeft(child: GridCardOne()),
            DrawInRight(child: GridCardTwo()),
            DrawInLeft(child: GridCardThree()),
            DrawInRight(child: GridCardFour()),
            DrawInLeft(child: GridCardFive()),

            DrawInRight(
                child: GridCard(
              color: Color.fromARGB(255, 156, 39, 176),
            )),
            DrawInLeft(
                child: GridCard(
              color: Color.fromARGB(255, 233, 30, 99),
            )),
            DrawInRight(
                child: GridCard(
              color: Color.fromARGB(255, 121, 85, 72),
            )),
          ],
        ));
  }
}

class GridCard extends StatelessWidget {
  final Color color;

  const GridCard({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: color,
      elevation: 5.0,
    );
  }
}
