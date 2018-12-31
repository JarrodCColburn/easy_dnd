import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StreamChannel extends StatefulWidget {
  @override
  _StreamChannelState createState() => _StreamChannelState();
}

class _StreamChannelState extends State<StreamChannel> {
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
    setState(() {
      controller.sink.add("$event");
    });
  }

  void _onError(Object error) {
    setState(() {
      controller.sink.add("Error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }
}
