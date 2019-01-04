import 'package:flutter/material.dart';

class SettingsRoute<T> extends MaterialPageRoute<T> {
  SettingsRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) {
      return child;
    }

    return FadeTransition(
      child: child,
      opacity: animation,
    );
  }
}
