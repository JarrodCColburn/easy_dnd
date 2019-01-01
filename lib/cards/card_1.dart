import 'dart:async';

import 'package:easy_dnd/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

class CardOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardOneState();
  }
}

class _CardOneState extends State<CardOne> {
  bool pressed = false;
  static const EventChannel eventChannel =
      EventChannel('strangerweather.com/easy_dnd/stream');
  static final controller = StreamController<String>();
  var _statusStream = controller.stream;

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    controller.sink.add("$event");
  }

  void _onError(Object error) {
    controller.sink.add("Error");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ScopedModel<AppModel>(
        model: AppModel(),
        child: ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => Card(
                color: Color.fromARGB(255, 76, 175, 80),
                elevation: 5.0,
                child: InkWell(
                  splashColor: Colors.blueGrey,
                  onTap: () {
                    setState(() {
                      pressed = !pressed;
                    });
                    pressed ? model.dndOn() : model.dndOff();
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                                textAlign: TextAlign.center,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
