import 'dart:async';

import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  final _platformChannel1 =
  MethodChannel('strangerweather.com/easy_dnd/receiver');

  Future<Null> dndOn() async {
    await _platformChannel1.invokeMethod('DND ON');
    notifyListeners();
  }

  Future<Null> dndOff() async {
    await _platformChannel1.invokeMethod('DND OFF');
    notifyListeners();
  }

  Future<Null> alarmsOnlyOn() async {
    await _platformChannel1.invokeMethod('ALARMS ONLY ON');
    notifyListeners();
  }

  Future<Null> priorityOnlyOn() async {
    await _platformChannel1.invokeMethod('PRIORITY ONLY ON');
    notifyListeners();
  }

  Future<Null> allPhoneCalls() async {
    await _platformChannel1.invokeMethod('ALL PHONE CALLS');
    notifyListeners();
  }
}