import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/model/Section.dart';
import 'package:flutter/foundation.dart';
import 'package:ssadpro/view/world_ui.dart';

class SectionUI extends StatefulWidget {
  final List<Section> list;
  int worldInt = 0;

  SectionUI({Key key, @required this.list, @required this.worldInt})
      : super(key: key);

  @override
  _SectionUIState createState() =>
      _SectionUIState(list: list, worldInt: worldInt);
}

class _SectionUIState extends State<SectionUI> {
  final List<Section> list;
  int worldInt = 0;

  _SectionUIState(
      {Key key,
      @required this.list,
      @required this.worldInt}); //: super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World $worldInt'),
        //title: Text(listt[0]),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              SectionBox(list[0].sectionName),
              SectionBox(list[1].sectionName),
            ],
          ),
          Row(
            children: <Widget>[
              SectionBox(list[2].sectionName),
              SectionBox(list[3].sectionName),
            ],
          ),
//          Row(
//            children: <Widget>[SectionBox('abc'), SectionBox('abc')],
//          ),
        ],
      ),
    );
  }
}

Container SectionBox(String Boxname) {
  return Container(
    margin: EdgeInsets.only(left: 80, top: 60),
    width: 100,
    height: 100,
    color: Colors.blue[300],
    child: FlatButton(
      child: Text('$Boxname'),
      onPressed: () {
        print('abc');
      },
    ),
  );
}
