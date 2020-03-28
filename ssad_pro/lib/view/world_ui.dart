import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/model/Section.dart';
import 'package:ssadpro/view/section.dart';
import 'package:ssadpro/model/World.dart';
import 'package:ssadpro/model/Student.dart';
import 'package:ssadpro/view/appbar.dart';

class WorldUI extends StatefulWidget {
  @override
  _WorldUIState createState() => _WorldUIState();
}

class _WorldUIState extends State<WorldUI> {
  @override
  Widget build(BuildContext context) {
    //---------------------------------------------------------------------------------
    //Mock Object data

    Student stu1 = Student('User1', 'pass1');
    // stu1.updateUnlockedWorld(); //to Unlock next world for this student.

    Section sec1 = new Section();
    sec1.sectionInt = 1;
    sec1.sectionName = 'W1S1';

    Section sec2 = new Section();
    sec2.sectionInt = 2;
    sec2.sectionName = 'W1S2';

    Section sec3 = new Section();
    sec3.sectionInt = 3;
    sec3.sectionName = 'W2S1';

    Section sec4 = new Section();
    sec4.sectionInt = 4;
    sec4.sectionName = 'W1S2';

    Section sec5 = new Section();
    sec5.sectionInt = 5;
    sec5.sectionName = 'W1S3';

    Section sec6 = new Section();
    sec6.sectionInt = 6;
    sec6.sectionName = 'W1S4';

    Section sec7 = new Section();
    sec7.sectionInt = 7;
    sec7.sectionName = 'W2S3';

    Section sec8 = new Section();
    sec8.sectionInt = 8;
    sec8.sectionName = 'W2S4';

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

    world2.worldInt = 2;
    world2.addSection(sec3);
    world2.addSection(sec4);
    world2.addSection(sec7);
    world2.addSection(sec8);

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
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(
          "Adventure", Colors.blue[600], Colors.grey[50]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              WorldBox(worldlist[0].worldInt.toString(), context,
                  stu1.unlockedWorldBool, worldlist, 0),
              WorldBox(worldlist[1].worldInt.toString(), context,
                  stu1.unlockedWorldBool, worldlist, 1),
            ],
          ),
          Row(
            children: <Widget>[
              WorldBox(worldlist[2].worldInt.toString(), context,
                  stu1.unlockedWorldBool, worldlist, 2),
              WorldBox(worldlist[3].worldInt.toString(), context,
                  stu1.unlockedWorldBool, worldlist, 3),
            ],
          ),
          Row(
            children: <Widget>[
              WorldBox(worldlist[4].worldInt.toString(), context,
                  stu1.unlockedWorldBool, worldlist, 4),
            ],
          ),
        ],
      ),
    );
  }
}

Stack WorldBox(String WorldID, BuildContext cont, List<bool> unlockedList,
    List<World> wlist, int index) {
  bool unlocked = false;

  if (index < unlockedList.length) {
    unlocked = true;
  }

  if (unlocked) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 80, top: 60),
          width: 100,
          height: 100,
          color: Colors.blue[300],
          child: FlatButton(
            child: Text('World $WorldID'),
            onPressed: () {
              Navigator.push(
                cont,
                MaterialPageRoute(
                  builder: (cont) => SectionUI(
                    list: wlist[index].sectionList,
                    worldInt: wlist[index].worldInt,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  } else {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 80, top: 60),
          padding: EdgeInsets.all(10),
          width: 100,
          height: 100,
          color: Colors.blue[300],
          child: FlatButton(
            child: Text('World $WorldID'),
            onPressed: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 80, top: 60),
          width: 100,
          height: 100,
          color: Colors.white.withOpacity(0.5),
          child: Icon(Icons.lock),
        ),
      ],
    );
  }
}
