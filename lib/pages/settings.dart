import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  var listItem;
  List<RadioModel> settingsCards = new List<RadioModel>();

  @override
  void initState() {
    super.initState();

    settingsCards.add(RadioModel(
      false,
      Icons.phone_in_talk,
      Color.fromARGB(255, 76, 175, 80),
      'All Phone Calls',
    ));
    settingsCards.add(RadioModel(
      false,
      Icons.contact_phone,
      Color.fromARGB(255, 3, 169, 244),
      'Contacts Only',
    ));
    settingsCards.add(RadioModel(
      false,
      Icons.star,
      Color.fromARGB(255, 255, 87, 34),
      'Starred Contacts Only',
    ));
    settingsCards.add(RadioModel(
      false,
      Icons.not_interested,
      Color.fromARGB(255, 255, 193, 7),
      'No Phone Calls',
    ));
    settingsCards.add(RadioModel(false, Icons.repeat,
        Color.fromARGB(255, 63, 81, 181), 'Allow Repeat Callers'));
  }

  @override
  Widget build(BuildContext context) {
    listItem = ListView.builder(
        itemCount: settingsCards.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(onTap: () {
            setState(() {
              setState(() {
                settingsCards.forEach((element) => element.isSelected = false);
                settingsCards[index].isSelected = true;
              });
              RadioItem(settingsCards[index]);
            });
          });
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Easy DND'),
      ),
      body: listItem,
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: _item.isSelected ? _item.color : Colors.blueGrey,
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
                _item.titles,
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
                color: _item.isSelected
                    ? Colors.orange
                    : Color.fromARGB(255, 69, 90, 100),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  _item.icons,
                  color: Colors.white70,
                  size: 50.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  String titles;
  Color color;
  IconData icons;

  RadioModel(this.isSelected, this.icons, this.color, this.titles);
}
