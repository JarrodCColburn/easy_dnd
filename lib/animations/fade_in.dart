import 'package:flutter/material.dart';

class MyFadeIn extends StatefulWidget {
  final Widget child;

  MyFadeIn({@required this.child});

  @override
  State<StatefulWidget> createState() {
    return MyFadeInState();
  }
}

class MyFadeInState extends State<MyFadeIn>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(controller);
    animation.addListener(() {
      this.setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Is Called");
    controller.forward();
    return FadeTransition(
      opacity: animation,
      child: widget.child,
    );
  }
}
