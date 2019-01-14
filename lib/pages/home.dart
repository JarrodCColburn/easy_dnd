import 'package:easy_dnd/animations/draw_in_effect.dart';
import 'package:easy_dnd/cards/gridcard_1.dart';
import 'package:easy_dnd/cards/gridcard_2.dart';
import 'package:easy_dnd/cards/gridcard_3.dart';
import 'package:easy_dnd/cards/gridcard_4.dart';
import 'package:easy_dnd/cards/gridcard_5.dart';
import 'package:easy_dnd/cards/gridcard_6.dart';
import 'package:easy_dnd/cards/gridcard_7.dart';
import 'package:easy_dnd/cards/gridcard_8.dart';
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
          DrawInRight(child: GridCardSix()),
          DrawInRight(child: GridCardSeven()),
          DrawInRight(child: GridCardEight()),
        ],
      ),
    );
  }
}
