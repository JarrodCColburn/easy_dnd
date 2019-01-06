import 'package:easy_dnd/animations/draw_in_effect.dart';
import 'package:easy_dnd/cards/settings_card_1.dart';
import 'package:easy_dnd/cards/settings_card_2.dart';
import 'package:easy_dnd/cards/settings_card_3.dart';
import 'package:easy_dnd/cards/settings_card_4.dart';
import 'package:easy_dnd/cards/settings_card_5.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy DND'),
      ),
      body: ListView(
        children: <Widget>[
          DrawInLeft(child: SettingsCardOne()),
          DrawInRight(child: SettingsCardTwo()),
          DrawInLeft(child: SettingsCardThree()),
          DrawInRight(child: SettingsCardFour()),
          DrawInLeft(child: SettingsCardFive()),
        ],
      ),
    );
  }
}
