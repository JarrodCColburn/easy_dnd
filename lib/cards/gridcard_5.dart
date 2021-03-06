import 'package:easy_dnd/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GridCardFive extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridCardFiveState();
  }
}

class GridCardFiveState extends State<GridCardFive> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 63, 81, 181),
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
              'Media Sounds ON',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              textAlign: TextAlign.center,
            )),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Icon(
              Icons.mic,
              color: Colors.white70,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
