import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/model/Section.dart';
import 'package:flutter/foundation.dart';
import 'package:ssadpro/view/world_ui.dart';
import 'package:ssadpro/view/appbar.dart';
import 'levelview.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/progress.dart';
import 'package:ssadpro/model/user.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/view/mcqpage.dart';

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
    User user = Provider.of<User>(context);
    print(this.list[1].sectionName);

    return Scaffold(
      appBar: ReusableWidgets.getAppBar(
          "World $worldInt", Colors.blue[600], Colors.grey[50]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<UserData>(
                stream: DatabaseService(email: user.email).userData,
                builder: (context, snapshot) {
                  //five entries in section progress: 4 sections and 1 final
                  List<bool> sect_progress = [true, false, false, false, false];
                  if (snapshot.hasData) {
                    UserData userData = snapshot.data;
                    if (worldInt <
                        int.parse(Progress.getWorld(userData.progress)))
                      sect_progress = [true, true, true, true, true];
                    else {
                      String sectionProgress =
                          Progress.getSection(userData.progress);
                      for (int i = 0; i < int.parse(sectionProgress); i++)
                        sect_progress[i] = true;
                    }
                  }
                  return Column(children: <Widget>[
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
                          style:
                              TextStyle(color: Colors.blue[600], fontSize: 20)),
                    ),
                    SizedBox(height: 50),
                    SectionBox(list[0].sectionName, Colors.blue[700], context,
                        sect_progress[0]),
                    SizedBox(height: 20),
                    SectionBox(list[1].sectionName, Colors.blue[700], context,
                        sect_progress[1]),
                    SizedBox(height: 20),
                    SectionBox(list[2].sectionName, Colors.blue[700], context,
                        sect_progress[2]),
                    SizedBox(height: 20),
                    SectionBox(list[3].sectionName, Colors.blue[700], context,
                        sect_progress[3]),
                    SizedBox(height: 50),
                    SectionBox(list[4].sectionName, Color(0xffffa41b), context,
                        sect_progress[4])
                  ]);
                })
//          Row(
//            children: <Widget>[SectionBox('abc'), SectionBox('abc')],
//          ),
          ],
        ),
      ),
    );
  }
}

SizedBox SectionBox(
    String boxname, Color color, BuildContext cont, bool sect_progress) {
  return SizedBox(
    width: 300.0,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      textColor: Colors.white,
      color: (sect_progress == true) ? color : Colors.red,
      onPressed: () {
        if (sect_progress == true)
          Navigator.push(
              cont,
              MaterialPageRoute(
                  builder: (cont) => MCQPage("Q", "1", "2", "3", "4", 3)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(boxname,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          Icon(
            (sect_progress == true) ? Icons.lock_open : Icons.lock,
            size: 40,
          )
        ],
      ),
    ),
  );
}
