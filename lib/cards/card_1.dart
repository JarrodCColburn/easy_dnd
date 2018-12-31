import 'package:easy_dnd/cards/card_2.dart';
import 'package:easy_dnd/model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:easy_dnd/stream_channel.dart';

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
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                        ],
                      ),
                    );
                  },
                ),
              ),
        ),
      ),
    );
  }
}
