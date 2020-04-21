/**
 * This class return the page layout displaying
 * the 5 Worlds of our application.
 *  
 * @author Ritik Bhatia
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/model/Section.dart';
import 'section.dart';
import 'package:ssadpro/model/World.dart';
import 'package:ssadpro/model/Student.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/progress.dart';
import 'package:ssadpro/model/user.dart';
import 'package:provider/provider.dart';

class WorldUI extends StatefulWidget {
  @override
  _WorldUIState createState() => _WorldUIState(renderForward, worldToRender);
  final int renderForward;
  final int worldToRender;

  WorldUI(this.renderForward, this.worldToRender);
}

class _WorldUIState extends State<WorldUI> {
  final int renderForward;
  final int worldToRender;
  _WorldUIState(this.renderForward, this.worldToRender);

  final List<String> titles = [
    "Requirements Specification",
    "Design",
    "Implementation",
    "Testing",
    "Maintenance"
  ];

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    Student stu1 = Student(userName: user.email);

    Section sec1 = new Section();
    sec1.sectionInt = 1;
    sec1.sectionName = 'Requirements Elicitation';
    sec1.section_state=0;

    Section sec2 = new Section();
    sec2.sectionInt = 2;
    sec2.sectionName = 'Requirements Analysis';
    sec2.section_state=0;

    Section sec3 = new Section();
    sec3.sectionInt = 3;
    sec3.sectionName = 'Strategy Pattern';
    sec3.section_state=0;

    Section sec4 = new Section();
    sec4.sectionInt = 4;
    sec4.sectionName = 'Observer Pattern';
    sec4.section_state=0;

    Section sec5 = new Section();
    sec5.sectionInt = 5;
    sec5.sectionName = 'Software Architecture';
    sec5.section_state=0;

    Section sec6 = new Section();
    sec6.sectionInt = 6;
    sec6.sectionName = 'SRS';
    sec6.section_state=0;

    Section sec7 = new Section();
    sec7.sectionInt = 7;
    sec7.sectionName = 'Factory Pattern';
    sec7.section_state=0;

    Section sec8 = new Section();
    sec8.sectionInt = 8;
    sec8.sectionName = 'Facade Pattern';
    sec8.section_state=0;

    Section sec9 = new Section();
    sec9.sectionInt = 9;
    sec9.sectionName = 'World Quiz';
    sec9.section_state=0;

    Section sec10 = new Section();
    sec10.sectionInt = 10;
    sec10.sectionName = 'World Quiz';
    sec10.section_state=0;

    World world1 = new World();
    World world2 = new World();
    World world3 = new World();
    World world4 = new World();
    World world5 = new World();

    world1.worldInt = 1;
    world1.addSection(sec1);
    world1.addSection(sec2);
    world1.addSection(sec5);
    world1.addSection(sec6);
    world1.addSection(sec9);

    world2.worldInt = 2;
    world2.addSection(sec3);
    world2.addSection(sec4);
    world2.addSection(sec7);
    world2.addSection(sec8);
    world2.addSection(sec10);

    world3.worldInt = 3;
    world4.worldInt = 4;
    world5.worldInt = 5;

    List<World> worldlist = [world1, world2, world3, world4, world5];

    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Adventure", Colors.white, Color(0xff1F3668)),
        //extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage("assets/images/space.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.90), BlendMode.dstATop)
                )
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  StreamBuilder<UserData>(
                      stream: DatabaseService(email: user.email).userData,
                      builder: (context, snapshot) {
                        UserData userData;
                        if (snapshot.hasData) {
                          userData = snapshot.data;
                          String worldProgress =
                              Progress.getWorld(userData.progress);
                          int unlockedLength = stu1.unlockedWorldBool.length;
                          for (int i = unlockedLength;
                              i < int.parse(worldProgress);
                              i++) {
                            stu1.unlockedWorldBool.add(true);
                          }
                        }
                        return Column(
                          children: <Widget>[
                            Container(
                                child: nextPage(context, renderForward, worldlist,
                                    worldToRender, titles, userData)),
                            SizedBox(height: 20),
                            WorldBox(worldlist[0].worldInt.toString(), context,
                                stu1.unlockedWorldBool, worldlist, 0, titles[0]),
                            SizedBox(height: 20),
                            WorldBox(worldlist[1].worldInt.toString(), context,
                                stu1.unlockedWorldBool, worldlist, 1, titles[1]),
                            SizedBox(height: 20),
                            WorldBox(worldlist[2].worldInt.toString(), context,
                                stu1.unlockedWorldBool, worldlist, 2, titles[2]),
                            SizedBox(height: 20),
                            WorldBox(worldlist[3].worldInt.toString(), context,
                                stu1.unlockedWorldBool, worldlist, 3, titles[3]),
                            SizedBox(height: 20),
                            WorldBox(worldlist[4].worldInt.toString(), context,
                                stu1.unlockedWorldBool, worldlist, 4, titles[4])
                          ],
                        );
                      })
                ],
              ),
            ),
          ),
        ));
  }
}

Stack WorldBox(String WorldID, BuildContext cont, List<bool> unlockedList,
    List<World> wlist, int index, String title) {
  bool unlocked = false;

  if (index < unlockedList.length) {
    unlocked = true;
  }

  if (unlocked) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 350.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            textColor: Colors.white,
            color: Color(0xff2C8E29), //Colors.blue[700],
            onPressed: () {
              Navigator.push(
                cont,
                MaterialPageRoute(
                  builder: (cont) => SectionUI(
                    list: wlist[index].sectionList,
                    worldInt: wlist[index].worldInt,
                    title: title,
                  ),
                ),
              );
            },
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("World $WorldID",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Icon(
                      Icons.lock_open,
                      size: 40,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  } else {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 350.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            textColor: Colors.white,
            disabledColor: Color(0xffD3550C),//(0xffD35A26),//0xffD34C13),//0,//Colors.red[400],
            onPressed: null,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("World $WorldID",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Icon(
                      Icons.lock_outline,
                      size: 40,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/status.txt');
}

void createRecord(String res) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/status.txt');
  await file.writeAsString("Attempt " + res + "\n", mode: FileMode.append);
}

void deleteData() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/status.txt');
  await file.writeAsString("");
}

Future<String> getData() async {
  String text;
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/status.txt');
    text = await file.readAsString();
  } catch (e) {
    print("Couldn't read file");
  }
  return text;
}

nextPage(BuildContext context, int renderForward, List<World> worldlist,
    int worldToRender, List<String> titles, UserData userData) {
  String message;
  Color btnColor;
  if (renderForward == 0) {
    message = "Please complete all activies in the Level to unlock a Section";
    btnColor = Colors.white.withOpacity(0.5); //Colors.grey[300];
  } else {
    message =
        "Congrats! You have completed the level. Proceed to the next section";
    btnColor = Colors.greenAccent;
  }

  return RaisedButton(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        message,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      color: btnColor,
      onPressed: () async {
        if (renderForward == 1) {
          int section = int.parse(Progress.getSection(userData.progress));
          String newProgress = '';
          if (section == 5)
            newProgress = 'W2 S1 L1';
          else {
            section += 1;
            newProgress = 'W1 S' + section.toString() + ' L1';
          }
          await DatabaseService(email: userData.email)
              .updateStudentProgress(newProgress);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SectionUI(
                      list: worldlist[worldToRender - 1].sectionList,
                      worldInt: worldToRender,
                      title: titles[worldToRender - 1])));
        }
      });
}
