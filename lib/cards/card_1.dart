import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardOneState();
  }
}

class _CardOneState extends State<CardOne> {
  final _platformChannel1 =
  MethodChannel('strangerweather.com/easy_dnd/receiver');
  final _platformChannel2 = EventChannel('strangerweather.com/easy_dnd/stream');
  bool pressed = false;
  final controller = StreamController<String>();
  Stream<String> _statusStream;

  _CardOneState() {
    _statusStream = controller.stream;
  }

  Future<Null> _dndOn() async {
    await _platformChannel1.invokeMethod('ON');
  }

  Future<Null> _dndOff() async {
    await _platformChannel1.invokeMethod('OFF');
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  void initState() {
    super.initState();
    _platformChannel2
        .receiveBroadcastStream()
        .listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    print(event);
    controller.sink.add("$event");
  }

  void _onError(Object error) {
    controller.sink.add("Error");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Color.fromARGB(255, 76, 175, 80),
      elevation: 5.0,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () {
          setState(() {
            pressed = !pressed;
          });
          pressed ? _dndOn() : _dndOff();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: StreamBuilder<String>(
                  stream: _statusStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {}
                    return Text(
                      "${snapshot.data}",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    );
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
