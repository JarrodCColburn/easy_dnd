import 'package:easy_dnd/state_management/inherited_widget_class.dart';
import 'package:easy_dnd/state_management/model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class GridCardOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridCardOneState();
  }
}

class GridCardOneState extends State<GridCardOne> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final stream = StatusInheritedWidget.of(context).inheritedStatusStream;
    return ScopedModel<AppModel>(
      model: AppModel(),
      child: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) {
          return Card(
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
                child: StreamBuilder<String>(
                  stream: stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {}
                    return Text(
                      "${snapshot.data}",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
