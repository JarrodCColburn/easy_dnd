import 'package:easy_dnd/cards/card_1.dart';
import 'package:easy_dnd/cards/card_2.dart';
import 'package:easy_dnd/cards/card_3.dart';
import 'package:easy_dnd/cards/card_4.dart';
import 'package:easy_dnd/cards/settings_card_1.dart';
import 'package:easy_dnd/cards/settings_card_2.dart';
import 'package:easy_dnd/cards/settings_card_3.dart';
import 'package:easy_dnd/cards/settings_card_4.dart';
import 'package:easy_dnd/cards/settings_card_5.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy DND'),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(15.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: <Widget>[
          SettingsCardOne(),
          SettingsCardTwo(),
          SettingsCardThree(),
          SettingsCardFour(),
          SettingsCardFive(),
        ],
      ),
    );
  }
}
