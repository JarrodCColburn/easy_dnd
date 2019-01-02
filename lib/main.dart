import 'package:easy_dnd/cards/card_1.dart';
import 'package:easy_dnd/cards/card_2.dart';
import 'package:easy_dnd/cards/card_3.dart';
import 'package:easy_dnd/pages/home.dart';
import 'package:easy_dnd/state_management/inherited_widget_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(StatusStream(child: MyApp()));
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: HomePage());
  }
