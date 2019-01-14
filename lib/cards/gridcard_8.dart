import 'package:easy_dnd/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GridCardEight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridCardEightState();
  }
}

class GridCardEightState extends State<GridCardEight> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 121, 85, 72),
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
              'Advanced Settings',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              textAlign: TextAlign.center,
            )),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Icon(
              Icons.settings_applications,
              color: Colors.white70,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
