import 'package:easy_dnd/model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CardOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardOneState();
  }
}

class _CardOneState extends State<CardOne> {
  bool pressed = false;

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
                ),
              ),
        ),
      ),
    );
  }
}
//
//class _CardOneState extends State<CardOne> {
//  final _platformChannel2 = EventChannel('strangerweather.com/easy_dnd/stream');
//  final controller = StreamController<String>();
//  Stream<String> _statusStream;
//  bool pressed = false;
//
//  _CardOneState() {
//    _statusStream = controller.stream;
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    controller.close();
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _platformChannel2
//        .receiveBroadcastStream()
//        .listen(_onEvent, onError: _onError);
//  }
//
//  void _onEvent(Object event) {
//    print(event);
//    controller.sink.add("$event");
//  }
//
//  void _onError(Object error) {
//    controller.sink.add("Error");
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ScopedModel<AppModel>(
//      model: AppModel(),
//child: ScopedModelDescendant<Model>(
//  builder: (context, child, model) => Card(
//    color: Color.fromARGB(255, 76, 175, 80),
//    elevation: 5.0,
//    child: InkWell(
//      splashColor: Colors.blueGrey,
//
//      child: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
////            children: <Widget>[
////              Padding(
////                padding: EdgeInsets.only(left: 10.0, right: 10.0),
////                child: StreamBuilder<String>(
////                  stream: _statusStream,
////                  builder: (context, snapshot) {
////                    if (snapshot.hasData) {}
////                    return Text(
////                      "${snapshot.data}",
////                      style: TextStyle(color: Colors.white, fontSize: 20.0),
////                      textAlign: TextAlign.center,
////                    );
////                  },
////                ),
////              ),
////            ],
////        ),
////      ),
////,
////  ),
////),
////
////    );
////  }
//
//
////      child: Card(
////        color: Color.fromARGB(255, 76, 175, 80),
////        elevation: 5.0,
////        child: InkWell(
////          splashColor: Colors.blueGrey,
////          onTap: () {
////            setState(
////              () {
////                pressed = !pressed;
////              },
////            );
////            ScopedModelDescendant<AppModel>(
////              builder: (context, child, model) {
////                pressed ? model.dndOn() : model.dndOff();
////              },
////            );
////          },
////          child: Center(
////            child: Column(
////              mainAxisAlignment: MainAxisAlignment.center,
////              crossAxisAlignment: CrossAxisAlignment.center,
////              children: <Widget>[
////                Padding(
////                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
////                  child: StreamBuilder<String>(
////                    stream: _statusStream,
////                    builder: (context, snapshot) {
////                      if (snapshot.hasData) {}
////                      return Text(
////                        "${snapshot.data}",
////                        style: TextStyle(color: Colors.white, fontSize: 20.0),
////                        textAlign: TextAlign.center,
////                      );
////                    },
////                  ),
////                ),
////              ],
////            ),
////          ),
////        ),
////      ),
