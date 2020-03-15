import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SectionUI.dart';

class WorldUI extends StatefulWidget {
  @override
  _WorldUIState createState() => _WorldUIState();
}

class _WorldUIState extends State<WorldUI> {
  @override
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Page'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            print('back');
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              WorldBox('World 1', context),
              WorldBox('World 2', context)
            ],
          ),
          Row(
            children: <Widget>[
              WorldBox('asd', context),
              WorldBox('asdsa', context)
            ],
          ),
          Row(
            children: <Widget>[
              WorldBox('asf', context),
              WorldBox('qwoe', context)
            ],
          ),
        ],
      ),
    );
  }
}

Container WorldBox(String Boxname, BuildContext cont) {
  return Container(
    margin: EdgeInsets.only(left: 80, top: 60),
    width: 100,
    height: 100,
    color: Colors.blue[300],
    child: FlatButton(
      child: Text('$Boxname'),
      onPressed: () {
        Navigator.push(
          cont,
          MaterialPageRoute(builder: (cont) => SectionUI()),
        );
      },
    ),
  );
}
