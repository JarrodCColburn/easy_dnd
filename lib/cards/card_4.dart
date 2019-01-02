import 'package:flutter/material.dart';

class CardFour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardFourState();
  }
}

class _CardFourState extends State<CardFour> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 193, 7),
      elevation: 5.0,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  'PRIORITY SETTINGS',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
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
