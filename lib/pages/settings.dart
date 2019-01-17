import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

List<RadioModel> models = [
  (RadioModel(
    Icons.phone_in_talk,
    Color.fromARGB(255, 76, 175, 80),
    'All Phone Calls',
  )),
  (RadioModel(
    Icons.contact_phone,
    Color.fromARGB(255, 3, 169, 244),
    'Contacts Only',
  )),
  (RadioModel(
    Icons.star,
    Color.fromARGB(255, 255, 87, 34),
    'Starred Contacts Only',
  )),
  (RadioModel(
    Icons.not_interested,
    Color.fromARGB(255, 255, 193, 7),
    'No Phone Calls',
  )),
  (RadioModel(
      Icons.repeat, Color.fromARGB(255, 63, 81, 181), 'Allow Repeat Callers')),
];

class SettingsPageState extends State<SettingsPage> {
  List<RadioModel> settingsCards = <RadioModel>[];
  int selected;

  @override
  initState() {
    setState(() {
      settingsCards = models;
    });
    _getData().then(updateIdx);
    super.initState();
  }

  updateIdx(int idx) {
    setState(() {
      selected = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy DND'),
      ),
      body: ListView.builder(
        itemCount: settingsCards.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(
                () {
                  saveSelectedCard(index);
                  updateIdx(index);
                },
              );
            },
            child: RadioItem(
                settingsCards[index], (selected == index) ? true : false),
          );
        },
      ),
    );
  }
}

Future<int> _getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('card');
}

Future<bool> saveSelectedCard(int newIndex) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setInt('card', newIndex);
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  final bool _isSelected;

  RadioItem(this._item, this._isSelected);

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
                color: _isSelected ? Colors.blueGrey : _item.color,
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
                color: _isSelected
                    ? Color.fromARGB(255, 69, 90, 100)
                    : Colors.orange,
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
  String titles;
  Color color;
  IconData icons;

  RadioModel(this.icons, this.color, this.titles);
}
