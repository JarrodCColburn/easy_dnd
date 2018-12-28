import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _platformChannel1 =
  MethodChannel('strangerweather.com/easy_dnd/receiver');
  final _platformChannel2 = EventChannel('strangerweather.com/easy_dnd/stream');
  bool pressed = false;
  final controller = StreamController<String>();
  Stream<String> _statusStream;

  _MyAppState() {
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
    controller.sink.add("$event");
    print('$event');
  }

  void _onError(Object error) {
    controller.sink.add("Error");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Easy DND'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(15.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <Widget>[
            Card(
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
                      StreamBuilder<String>(
                        stream: _statusStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print("${snapshot.data}");
                          }
                          return Text(
                            "${snapshot.data}",
                            style:
                            TextStyle(color: Colors.white, fontSize: 25.0),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                      ),
                      Text(
                        'Alarms',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Media',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Touch Sounds',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Example(
              text: 'Example 2',
              color: Color.fromARGB(255, 3, 169, 244),
            ),
            Example(
              text: 'Example 3',
              color: Color.fromARGB(255, 255, 87, 34),
            ),
            Example(
              text: 'Example 4',
              color: Color.fromARGB(255, 255, 193, 7),
            ),
            Example(
              text: 'Example 5',
              color: Color.fromARGB(255, 63, 81, 181),
            ),
            Example(
              text: 'Example 6',
              color: Color.fromARGB(255, 156, 39, 176),
            ),
            Example(
              text: 'Example 7',
              color: Color.fromARGB(255, 233, 30, 99),
            ),
            Example(
              text: 'Example 8',
              color: Color.fromARGB(255, 121, 85, 72),
            ),
          ],
        ),
      ),
    );
  }
}

class Example extends StatelessWidget {
  Example({@required this.text, this.color = Colors.white});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    Card(
      color: color,
      elevation: 5.0,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}