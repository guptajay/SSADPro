/**
 * This class return the page layout displaying
 * sections of each world.
 * 
 *
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/model/Section.dart';
import 'package:flutter/foundation.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/services/database.dart';
import 'package:ssadpro/model/progress.dart';
import 'package:ssadpro/model/user.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/view/mcqpage.dart';
import 'package:ssadpro/services/mcq_generator.dart';

class SectionUI extends StatefulWidget {
  final List<Section> list;
  int worldInt = 0;
  String title = "";

  SectionUI(
      {Key key,
      @required this.list,
      @required this.worldInt,
      @required this.title})
      : super(key: key);

  @override
  _SectionUIState createState() =>
      _SectionUIState(list: list, worldInt: worldInt, title: title);
}

class _SectionUIState extends State<SectionUI> {
  final List<Section> list;
  int worldInt = 0;
  String title = "";

  _SectionUIState(
      {Key key,
      @required this.list,
      @required this.worldInt,
      @required this.title});
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Scaffold(
      appBar: ReusableWidgets.getAppBar(
          "World $worldInt", Colors.white, Color(0xff1F3668)),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*1.0008,
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("assets/images/space.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.90), BlendMode.dstATop)
              )
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<UserData>(
                    stream: DatabaseService(email: user.email).userData,
                    builder: (context, snapshot) {
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
                            bottom: BorderSide(color: Colors.white),//lightBlue.shade900),
                          )),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Text(title,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 20),
                        SectionBox(list[0].sectionName, Colors.blue[700], context,
                            sect_progress[0], '1', worldInt, list[0].section_state),
                        SizedBox(height: 20),
                        SectionBox(list[1].sectionName, Colors.blue[700], context,
                            sect_progress[1], '2', worldInt, list[0].section_state),
                        SizedBox(height: 20),
                        SectionBox(list[2].sectionName, Colors.blue[700], context,
                            sect_progress[2], '3', worldInt, list[0].section_state),
                        SizedBox(height: 20),
                        SectionBox(list[3].sectionName, Colors.blue[700], context,
                            sect_progress[3], '4', worldInt, list[0].section_state),
                        SizedBox(height: 50),
                        SectionBox(list[4].sectionName, Color(0xffffa41b), context,
                            sect_progress[4], '5', worldInt, list[0].section_state)
                      ]);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

SizedBox SectionBox(String boxname, Color color, BuildContext cont,
    bool sect_progress, String section, int world, int section_state) {
  return SizedBox(
    width: 350.0,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      textColor: Colors.white,
      color: (sect_progress == true) ? Color(0xff2C8E29) : Color(0xffD35A26),
      onPressed: () {
        if (sect_progress == true) {
//          section_state = DynamicPrediction().dynamicprediction(section_state, 0);
          List<String> question =
              GenerateMCQ().question(world, int.parse(section), 1, section_state);
          Navigator.push(
              cont,
              MaterialPageRoute(
                  builder: (cont) => MCQPage(
                      question[0],
                      question[1],
                      question[2],
                      question[3],
                      question[4],
                     section_state,
                      int.parse(question[5]),
                      world,
                      int.parse(section),
                      1)));
        }
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Section ' + section,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Icon(
                (sect_progress == true) ? Icons.lock_open : Icons.lock,
                size: 40,
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(boxname,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ])
        ],
      ),
    ),
  );
}
