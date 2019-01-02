import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class StatusStream extends StatefulWidget{
  final Widget child;
  StatusStream({this.child});

  @override
  State<StatefulWidget> createState() => _StatusStreamState();

}

class _StatusStreamState extends State<StatusStream>{
  static const EventChannel eventChannel =
  EventChannel('strangerweather.com/easy_dnd/stream');
  static final controller = StreamController<String>();
  var statusStream = controller.stream;

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
    print (event);
  }

  void _onError(Object error) {
    controller.sink.add("Error");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatusInheritedWidget(inheritedStatusStream: statusStream ,child:widget.child );
  }
}


class StatusInheritedWidget extends InheritedWidget{

  final Stream <String> inheritedStatusStream;

  StatusInheritedWidget({this.inheritedStatusStream, Widget child}): super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static StatusInheritedWidget of(BuildContext context)=>
      context.inheritFromWidgetOfExactType(StatusInheritedWidget);

}