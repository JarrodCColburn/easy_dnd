import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class DrawInLeft extends StatefulWidget {
  final Widget child;

  DrawInLeft({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DrawInLeftState();
  }
}

class DrawInLeftState extends State<DrawInLeft> with TickerProviderStateMixin, AfterLayoutMixin<DrawInLeft>{
  AnimationController _controller;
  Animation animation;


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform:
              Matrix4.translationValues(animation.value * width, 0.0, 0.0),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _controller.forward();
  }
}

class DrawInRight extends StatefulWidget {
final Widget child;

DrawInRight({Key key, this.child}) : super(key: key);

@override
State<StatefulWidget> createState() {
  return DrawInRightState();
}
}

class DrawInRightState extends State<DrawInRight> with TickerProviderStateMixin, AfterLayoutMixin<DrawInRight> {
  AnimationController _controller;
  Animation animation;


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform:
          Matrix4.translationValues(animation.value * width, 0.0, 0.0),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _controller.forward();
  }
}