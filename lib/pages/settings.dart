import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    var titles = [
      'All Phone Calls',
      'Contacts Only',
      'Starred Contacts Only',
      'No Phone Calls',
      'Allow Repeat Callers'
    ];

    var colors=[
    Color.fromARGB(255, 76, 175, 80),
    Color.fromARGB(255, 3, 169, 244),
    Color.fromARGB(255, 255, 87, 34),
    Color.fromARGB(255, 255, 193, 7),
    Color.fromARGB(255, 63, 81, 181),
    ];

    var icons=[
      Icons.phone_in_talk,
      Icons.contact_phone,
      Icons.star,
      Icons.not_interested,
      Icons.repeat,
    ];

    var listItem = ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: _handleTap,
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 24.0,
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 124.0,
                  margin: EdgeInsets.only(left: 46.0),
                  decoration: BoxDecoration(
                      color: _active
                          ? colors[index]
                          : Colors.blueGrey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0.0, 10.0))
                      ]),
                  child: Center(
                    child: Text(
                      titles[index],
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  alignment: FractionalOffset.centerLeft,
                  child: Container(
                    width: 92.0,
                    height: 92.0,
                    decoration: new BoxDecoration(
                      color: _active
                          ? Colors.orange
                          : Color.fromARGB(255, 69, 90, 100),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        icons[index],
                        color: Colors.white70,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Easy DND'),
      ),
      body: listItem,
    );
  }
}
