import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/model/Section.dart';
import 'package:ssadpro/view/settings.dart';
import 'section.dart';
import 'package:ssadpro/model/World.dart';
import 'package:ssadpro/model/Student.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
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
//  TextEditingController keyInputController = new TextEditingController();
//  TextEditingController valueInputController = new TextEditingController();
//
//  File jsonFile;
//  Directory dir;
//  String fileName = 'myJSONFile.json';
//  bool fileExists = false;
//  Map<String, String> fileContent;
//
//  @override
//  void initState() {
//    super.initState();
//    getApplicationDocumentsDirectory().then((Directory directory) {
//      dir = directory;
//      jsonFile = new File(dir.path + "/" + fileName);
//      fileExists = jsonFile.existsSync();
//      if (fileExists)
//        this.setState(
//            () => fileContent = json.decode(jsonFile.readAsStringSync()));
//    });
//  }
//
//  @override
//  void dispose() {
//    keyInputController.dispose();
//    valueInputController.dispose();
//    super.dispose();
//  }
//
//  void createFile(
//      Map<String, dynamic> content, Directory dir, String fileName) {
//    print("Creating file!");
//    File file = new File(dir.path + "/" + fileName);
//    file.createSync();
//    fileExists = true;
//    file.writeAsStringSync(json.encode(content));
//  }
//
//  void writeToFile(String key, dynamic value) {
//    print("Writing to file!");
//    Map<String, dynamic> content = {key: value};
//    if (fileExists) {
//      print("File exists");
//      Map<String, dynamic> jsonFileContent =
//          json.decode(jsonFile.readAsStringSync());
//      jsonFileContent.addAll(content);
//      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
//    } else {
//      print("File does not exist!");
//      createFile(content, dir, fileName);
//    }
//    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
//    print(fileContent);
//  }

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
    //---------------------------------------------------------------------------------
    //Logged in user
    User user = Provider.of<User>(context);

    //Mock Data
    Student stu1 = Student(userName: user.email);
    // stu1.updateUnlockedWorld(); //to Unlock next world for this student.

    Section sec1 = new Section();
    sec1.sectionInt = 1;
    sec1.sectionName = 'Requirements Elicitation';

    Section sec2 = new Section();
    sec2.sectionInt = 2;
    sec2.sectionName = 'Requirements Analysis';

    Section sec3 = new Section();
    sec3.sectionInt = 3;
    sec3.sectionName = 'Strategy Pattern';

    Section sec4 = new Section();
    sec4.sectionInt = 4;
    sec4.sectionName = 'Observer Pattern';

    Section sec5 = new Section();
    sec5.sectionInt = 5;
    sec5.sectionName = 'Software Architecture';

    Section sec6 = new Section();
    sec6.sectionInt = 6;
    sec6.sectionName = 'SRS';

    Section sec7 = new Section();
    sec7.sectionInt = 7;
    sec7.sectionName = 'Factory Pattern';

    Section sec8 = new Section();
    sec8.sectionInt = 8;
    sec8.sectionName = 'Facade Pattern';

    Section sec9 = new Section();
    sec9.sectionInt = 9;
    sec9.sectionName = 'World Quiz';

    Section sec10 = new Section();
    sec10.sectionInt = 10;
    sec10.sectionName = 'World Quiz';

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

    List<World> worldlist = [
      world1,
      world2,
      world3,
      world4,
      world5
    ]; //Each world consists of 4 section . but now only world1,world2 has sections.
//--------------------------------------------------------------------------------------
//    String json = jsonEncode(world1);
//    Map<String, dynamic> user = jsonDecode(json);
//    print(user['worldInt']);
//    user['world1']

    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Adventure", Colors.blue[600], Colors.grey[50]),
        body: Center(
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
                side: BorderSide(color: Colors.white)),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            textColor: Colors.white,
            color: Colors.blue[700],
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

//    return Stack(
//      children: <Widget>[
//        Container(
//          margin: EdgeInsets.only(left: 80, top: 60),
//          width: 100,
//          height: 100,
//          color: Colors.blue[300],
//          child: FlatButton(
//            child: Text('World $WorldID'),
//            onPressed: () {
//              Navigator.push(
//                cont,
//                MaterialPageRoute(
//                  builder: (cont) => SectionUI(
//                    list: wlist[index].sectionList,
//                    worldInt: wlist[index].worldInt,
//                  ),
//                ),
//              );
//            },
//          ),
//        ),
//      ],
//    );

  } else {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 350.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            textColor: Colors.white,
            color: Colors.red[400],
            onPressed: () {},
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
//
//Column(
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//SizedBox(height: 50),
//Row(
//children: <Widget>[
//WorldBox(worldlist[0].worldInt.toString(), context,
//stu1.unlockedWorldBool, worldlist, 0),
//WorldBox(worldlist[1].worldInt.toString(), context,
//stu1.unlockedWorldBool, worldlist, 1),
//],
//),
//Row(
//children: <Widget>[
//WorldBox(worldlist[2].worldInt.toString(), context,
//stu1.unlockedWorldBool, worldlist, 2),
//WorldBox(worldlist[3].worldInt.toString(), context,
//stu1.unlockedWorldBool, worldlist, 3),
//],
//),
//Row(
//children: <Widget>[
//WorldBox(worldlist[4].worldInt.toString(), context,
//stu1.unlockedWorldBool, worldlist, 4),
//],
//),
//],
//),

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
    btnColor = Colors.grey[300];
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
