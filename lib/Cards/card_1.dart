import 'package:flutter/material.dart';
import 'package:easy_dnd/main.dart';

class CardOne extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardOneState();
  }
}

class _CardOneState extends State<CardOne> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 76, 175, 80),
      elevation: 5.0,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () {
          setState(() {
            pressed = !pressed;
          });
          pressed ? _dndOn() : _dndOff();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: StreamBuilder<String>(
                  stream: _statusStream,
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
    );
  }
}
