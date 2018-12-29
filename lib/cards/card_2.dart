import 'package:flutter/material.dart';

class CardTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardTwoState();
  }
}

class _CardTwoState extends State<CardTwo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Color.fromARGB(255, 3, 169, 244),
      elevation: 5.0,
      child: InkWell(
        splashColor: Colors.blueGrey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  "",
                  style:
                  TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}