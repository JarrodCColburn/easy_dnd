import 'package:easy_dnd/state_management/inherited_widget_class.dart';
import 'package:easy_dnd/state_management/model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CardOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardOneState();
  }
}

class _CardOneState extends State<CardOne> {
  bool pressed = false;


  @override
  Widget build(BuildContext context) {
    final stream = StatusInheritedWidget.of(context).inheritedStatusStream;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ScopedModel<AppModel>(
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
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: StreamBuilder<String>(
                            stream: stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {}
                              return Text(
                                "${snapshot.data}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
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
    );
  }
}
