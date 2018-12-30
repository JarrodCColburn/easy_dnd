import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardTwoState();
  }
}

class _CardTwoState extends State<CardTwo> {
  final _platformChannel1 =
  MethodChannel('strangerweather.com/easy_dnd/receiver');
  bool pressed = false;

  Future<Null> _dndOff() async {
    await _platformChannel1.invokeMethod('OFF');
  }

  Future<Null> _alarmsOnlyOn() async {
    await _platformChannel1.invokeMethod('ALARMS ONLY ON');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 3, 169, 244),
      elevation: 5.0,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () {
          setState(() {
            pressed = !pressed;
          });
          pressed ? _alarmsOnlyOn() : _dndOff();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text('',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
