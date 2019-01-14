import 'package:easy_dnd/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GridCardSeven extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridCardSevenState();
  }
}

class GridCardSevenState extends State<GridCardSeven> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 233, 30, 99),
      elevation: 5.0,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () => Navigator.push(
          context,
          PageTransition(
              child: SettingsPage(), type: PageTransitionType.rightToLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (Text(
              'Touch Sounds ON',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              textAlign: TextAlign.center,
            )),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Icon(
              Icons.touch_app,
              color: Colors.white70,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}