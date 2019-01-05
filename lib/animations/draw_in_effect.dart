import 'package:easy_dnd/cards/card_1.dart';
import 'package:easy_dnd/cards/card_3.dart';
import 'package:flutter/material.dart';

class DrawIn extends StatefulWidget {
  final child;

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
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Transform(
            transform:
                Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
            child: Expanded(child: Column(
              children: <Widget>[
                CardOne(),
                CardThree(),
              ],
            ),
            ), ),
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
