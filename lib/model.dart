import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  final _platformChannel1 =
      MethodChannel('strangerweather.com/easy_dnd/receiver');

  Future<Null> dndOn() async {
    await _platformChannel1.invokeMethod('ON');
    notifyListeners();
  }

  Future<Null> dndOff() async {
    await _platformChannel1.invokeMethod('OFF');
    notifyListeners();
  }
}
