import 'package:easy_dnd/state_management/inherited_widget_class.dart';
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
    final stream = StatusInheritedWidget.of(context).inheritedStatusStream;
    return Center(
      child: Card(
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
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: StreamBuilder<String>(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data
                        .toString()
                        .contains('All Interruptions Accepted')) {
                      return Text(
                        'Alarms are working',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      );
                    } else if (snapshot.data
                            .toString()
                            .contains('No Interruptions Accepted') ||
                        snapshot.data.toString().contains(
                            'No Interruptions Except Priority Ones')) {
                      return Text(
                        'No Alarms',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      );
                    } else if (snapshot.data
                        .toString()
                        .contains('No Interruptions Except Alarms')) {
                      return Text(
                        'No Interruptions Except Alarms',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
