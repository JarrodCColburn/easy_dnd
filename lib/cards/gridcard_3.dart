import 'package:easy_dnd/state_management/inherited_widget_class.dart';
import 'package:easy_dnd/state_management/model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class GridCardThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridCardThreeState();
  }
}

class GridCardThreeState extends State<GridCardThree> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final stream = StatusInheritedWidget.of(context).inheritedStatusStream;
    return ScopedModel<AppModel>(
      model: AppModel(),
      child: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) {
          return Card(
            color: Color.fromARGB(255, 255, 87, 34),
            elevation: 5.0,
            child: InkWell(
              splashColor: Colors.blueGrey,
              onTap: () {
                setState(() {
                  pressed = !pressed;
                });
                pressed ? model.priorityOnlyOn() : model.dndOff();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: StreamBuilder<String>(
                      stream: stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data
                                  .toString()
                                  .contains('No Interruptions Accepted') ||
                              snapshot.data
                                  .toString()
                                  .contains('No Interruptions Except Alarms')) {
                            return Text(
                              'No Priority Interruptions',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                              textAlign: TextAlign.center,
                            );
                          } else if (snapshot.data.toString().contains(
                              'No Interruptions Except Priority Ones')) {
                            return Text(
                              'No Interruptions Except Priority Ones',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                              textAlign: TextAlign.center,
                            );
                          }
                        }
                        return Text('Priority Interruptions Accepted',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.white70,
                    size: 50.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
