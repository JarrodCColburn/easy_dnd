import 'package:easy_dnd/state_management/inherited_widget_class.dart';
import 'package:easy_dnd/state_management/model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/animation.dart';

class CardOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardOneState();
  }
}

class _CardOneState extends State<CardOne> with TickerProviderStateMixin {
  bool pressed = false;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final stream = StatusInheritedWidget.of(context).inheritedStatusStream;
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Transform(
            transform:
            Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
            child: new Center(
              child: ScopedModel<AppModel>(
                model: AppModel(),
                child: ScopedModelDescendant<AppModel>(
                  builder: (context, child, model) => Card(
                    color: Color.fromARGB(255, 76, 175, 80),
                    elevation: 5.0,
                    child: InkWell(
                      splashColor: Colors.blueGrey,
                      onTap: () {
                        setState(() {
                          pressed = !pressed;
                        });
                        pressed ? model.dndOn() : model.dndOff();
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                              EdgeInsets.only(left: 10.0, right: 10.0),
                              child: StreamBuilder<String>(
                                stream: stream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {}
                                  return Text(
                                    "${snapshot.data}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
