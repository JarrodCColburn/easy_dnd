import 'package:flutter/material.dart';

class DrawIn extends StatefulWidget {
  final Widget child;

  DrawIn({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DrawInState();
  }
}

class DrawInState extends State<DrawIn> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

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
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
