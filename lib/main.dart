import 'package:easy_dnd/cards/card_1.dart';
import 'package:easy_dnd/cards/card_2.dart';
import 'package:easy_dnd/inherited_widget_class.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(StatusStream(child: MyApp()));
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
      home: Scaffold(
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
            CardOne(),
            CardTwo(),
            Example(
              text: 'Block Priority',
              color: Color.fromARGB(255, 255, 87, 34),
            ),
            Example(
              text: 'No Sound from Notifications',
              color: Color.fromARGB(255, 255, 193, 7),
            ),
            Example(
              text: 'Example 5',
              color: Color.fromARGB(255, 63, 81, 181),
            ),
            Example(
              text: 'Example 6',
              color: Color.fromARGB(255, 156, 39, 176),
            ),
            Example(
              text: 'Example 7',
              color: Color.fromARGB(255, 233, 30, 99),
            ),
            Example(
              text: 'Example 8',
              color: Color.fromARGB(255, 121, 85, 72),
            ),
          ],
        ),
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
