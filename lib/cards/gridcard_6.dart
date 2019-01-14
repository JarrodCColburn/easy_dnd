import 'package:easy_dnd/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GridCardSix extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridCardSixState();
  }
}

class GridCardSixState extends State<GridCardSix> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 156, 39, 176),
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
              'Notifications ON',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              textAlign: TextAlign.center,
            )),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Icon(
              Icons.notifications,
              color: Colors.white70,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
