import 'package:easy_dnd/animations/draw_in_effect.dart';
import 'package:flutter/material.dart';

class SettingsCardOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsCardOneState();
  }
}

class SettingsCardOneState extends State<SettingsCardOne> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 124.0,
              margin: EdgeInsets.only(left: 46.0),
              decoration: BoxDecoration(
                  color: _active
                      ? Color.fromARGB(255, 76, 175, 80)
                      : Colors.blueGrey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0.0, 10.0))
                  ]),
              child: Center(
                child: Text(
                  'All Phone Calls',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              alignment: FractionalOffset.centerLeft,
              child: Container(
                width: 92.0,
                height: 92.0,
                decoration: new BoxDecoration(
                  color: _active
                      ? Colors.orange
                      : Colors.blueGrey,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.phone_in_talk,
                    color: Colors.white70,
                    size: 50.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
