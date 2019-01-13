import 'package:easy_dnd/state_management/inherited_widget_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardThreeState();
  }
}

class _CardThreeState extends State<CardThree> {
  final _platformChannel1 =
      MethodChannel('strangerweather.com/easy_dnd/receiver');
  bool pressed = false;

  Future<Null> _dndOff() async {
    await _platformChannel1.invokeMethod('OFF');
  }

  Future<Null> priorityOnlyOn() async {
    await _platformChannel1.invokeMethod('PRIORITY ONLY ON');
  }

  @override
  Widget build(BuildContext context) {
    final stream = StatusInheritedWidget.of(context).inheritedStatusStream;
    return Card(
      color: Color.fromARGB(255, 255, 87, 34),
      elevation: 5.0,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () {
          setState(() {
            pressed = !pressed;
          });
          pressed ? priorityOnlyOn() : _dndOff();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: StreamBuilder<String>(
                  stream: stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data
                          .toString()
                          .contains('All Interruptions Accepted')) {
                        return Column(children: [
                          Text(
                            'Priority Interruptions Accepted',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                          ),
                          Text(
                            'all interruptions accepted',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ]);
                      } else if (snapshot.data
                              .toString()
                              .contains('No Interruptions Accepted') ||
                          snapshot.data
                              .toString()
                              .contains('No Interruptions Except Alarms')) {
                        return Text(
                          'No Priority Interruptions',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.center,
                        );
                      } else if (snapshot.data
                          .toString()
                          .contains('No Interruptions Except Priority Ones')) {
                        return Text(
                          'No Interruptions Except Priority Ones',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.center,
                        );
                      }
                    }

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
