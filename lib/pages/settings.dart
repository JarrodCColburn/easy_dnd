import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  List<RadioModel> settingsCards = new List<RadioModel>();
  bool status = false;
  int newIndex;

  @override
  void initState() {
    super.initState();

    settingsCards.add(RadioModel(
      status,
      Icons.phone_in_talk,
      Color.fromARGB(255, 76, 175, 80),
      'All Phone Calls',
    ));
    settingsCards.add(RadioModel(
      status,
      Icons.contact_phone,
      Color.fromARGB(255, 3, 169, 244),
      'Contacts Only',
    ));
    settingsCards.add(RadioModel(
      status,
      Icons.star,
      Color.fromARGB(255, 255, 87, 34),
      'Starred Contacts Only',
    ));
    settingsCards.add(RadioModel(
      status,
      Icons.not_interested,
      Color.fromARGB(255, 255, 193, 7),
      'No Phone Calls',
    ));
    settingsCards.add(RadioModel(status, Icons.repeat,
        Color.fromARGB(255, 63, 81, 181), 'Allow Repeat Callers'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy DND'),
      ),
      body: FutureBuilder(
          future: loadSelectedCard(newIndex),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                _getData(snapshot);
                return ListView.builder(
                    itemCount: settingsCards.length,
                    itemBuilder: (BuildContext context, int index) {
                      newIndex = snapshot.data;
                      settingsCards[newIndex].isSelected = true;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            settingsCards.forEach(
                                (element) => element.isSelected = false);
                            settingsCards[index].isSelected = true;
                            saveSelectedCard(index);
                          });
                        },
                        child: RadioItem(settingsCards[index]),
                      );
                    });
              }
            }
            return Text('LOADING...');
          }),
    );
  }
}

Future _getData(AsyncSnapshot snapshot) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('card');
}

Future<bool> saveSelectedCard(int newIndex) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setInt('card', newIndex);
}

Future<int> loadSelectedCard(int newIndex) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  newIndex = prefs.getInt('card');
  return newIndex;
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
                color: _item.isSelected ? Colors.blueGrey : _item.color,
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
  bool isSelected;
  String titles;
  Color color;
  IconData icons;

  RadioModel(this.isSelected, this.icons, this.color, this.titles);
}
