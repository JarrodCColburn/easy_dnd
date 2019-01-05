import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class DrawIn extends StatefulWidget {
  final Widget child;

  DrawIn({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DrawInState();
  }
}

class DrawInState extends State<DrawIn>
    with TickerProviderStateMixin, AfterLayoutMixin<DrawIn> {
  AnimationController _controller;
  Animation _animation;

  void afterFirstLayout(BuildContext context) {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform:
              Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
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

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
