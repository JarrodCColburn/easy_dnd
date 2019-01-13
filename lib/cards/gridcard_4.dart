import 'package:easy_dnd/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GridCardFour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridCardFourState();
  }
}

class GridCardFourState extends State<GridCardFour> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 193, 7),
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
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                'PRIORITY SETTINGS',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Icon(
              Icons.touch_app,
              color: Colors.white,
              size: 80.0,
            ),
          ],
        ),
      ),
    );
  }
}
