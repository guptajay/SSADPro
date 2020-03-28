import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/model/Section.dart';
import 'package:flutter/foundation.dart';
import 'package:ssadpro/view/world_ui.dart';
import 'package:ssadpro/view/appbar.dart';
import 'levelview.dart';

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
      appBar: ReusableWidgets.getAppBar(
          "World $worldInt", Colors.blue[600], Colors.grey[50]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.lightBlue.shade900),
              )),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Text("Requirement Elicitation",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue[600], fontSize: 20)),
            ),
            SizedBox(height: 50),
            SectionBox(list[0].sectionName, Colors.blue[700], context),
            SizedBox(height: 20),
            SectionBox(list[1].sectionName, Colors.blue[700], context),
            SizedBox(height: 20),
            SectionBox(list[2].sectionName, Colors.blue[700], context),
            SizedBox(height: 20),
            SectionBox(list[3].sectionName, Colors.blue[700], context),
            SizedBox(height: 50),
            SectionBox(list[4].sectionName, Color(0xffffa41b), context)

//          Row(
//            children: <Widget>[SectionBox('abc'), SectionBox('abc')],
//          ),
          ],
        ),
      ),
    );
  }
}

SizedBox SectionBox(String Boxname, Color color, BuildContext cont) {
  return SizedBox(
    width: 300.0,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)),
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      textColor: Colors.white,
      color: color,
      onPressed: () {
        Navigator.push(
            cont, MaterialPageRoute(builder: (cont) => LevelViewPage()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Boxname,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}
