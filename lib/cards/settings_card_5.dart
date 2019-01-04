import 'package:flutter/material.dart';


class SettingsCardFive extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          settingsCard,
          settingsThumbnail,
        ],
      ),
    );
  }
}


final settingsThumbnail = Container(
  margin: EdgeInsets.symmetric(
      vertical: 16.0),
  alignment: FractionalOffset.centerLeft,
  child: settingsCircle,
);

final settingsCircle = Container(
  width: 92.0,
  height: 92.0,
  decoration: new BoxDecoration(
    color: Colors.orange,
    shape: BoxShape.circle,
  ),
);

final settingsCard = Container(
  height: 124.0,
  margin: EdgeInsets.only(left: 46.0),
  decoration: BoxDecoration(
      color: Color.fromARGB(255, 63, 81, 181),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0.0, 10.0)
        )
      ]
  ),
);