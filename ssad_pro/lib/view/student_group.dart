import 'package:flutter/material.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/Student.dart';
import 'package:ssadpro/model/StudentGroup.dart';
import 'package:ssadpro/view/login.dart';
import 'appbar.dart';

class StudentGroupPage extends StatefulWidget {
  @override
  _StudentGroupState createState() => _StudentGroupState();
}

class _StudentGroupState extends State<StudentGroupPage> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  int indexOfDeleted;
  static List<StudentGroup> studentGroups = [
    StudentGroup(groupId: 'CZ001', groupName: 'SS1', members: ['stu001','stu002','stu003']),
    StudentGroup(groupId: 'CZ001', groupName: 'SS2', members: ['stu004','stu005','stu006']),
    StudentGroup(groupId: 'CZ001', groupName: 'SS3', members: ['stu007','stu008','stu009']),
    StudentGroup(groupId: 'CZ001', groupName: 'SS4', members: ['stu010','stu011','stu012']),
    StudentGroup(groupId: 'CZ002', groupName: 'TS1', members: ['stu001','stu002','stu003']),
    StudentGroup(groupId: 'CZ002', groupName: 'TS2', members: ['stu004','stu005','stu006']),
    StudentGroup(groupId: 'CZ002', groupName: 'TS3', members: ['stu007','stu008','stu009']),
    StudentGroup(groupId: 'CZ002', groupName: 'TS4', members: ['stu010','stu011','stu012']),
    StudentGroup(groupId: 'CZ005', groupName: 'SSP1', members: ['stu001','stu002','stu003']),
    StudentGroup(groupId: 'CZ005', groupName: 'SSP2', members: ['stu004','stu005','stu006']),
    StudentGroup(groupId: 'CZ005', groupName: 'SSP3', members: ['stu007','stu008','stu009']),
    StudentGroup(groupId: 'CZ005', groupName: 'SSP4', members: ['stu010','stu011','stu012'])
  ];
  List<StudentGroup> list = studentGroups;
  Future refreshList() async{
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      list = studentGroups;
    });

  }
  Future<bool> passingIndex(int index){
    indexOfDeleted = index;
    deleteGroupDialog(context).then((onValue){
      if(onValue){
        studentGroups.removeAt(indexOfDeleted);
      }
    });
  }
  Future<bool> deleteGroupDialog(BuildContext context){
    String groupId = studentGroups[indexOfDeleted].groupId;
    String groupName = studentGroups[indexOfDeleted].groupName;
    String members = studentGroups[indexOfDeleted].members.toString();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
          title: Text("Group Id: $groupId\nGroup Name: $groupName\n"
              "Members: $members"),
          content: SizedBox(
            width: MediaQuery.of(context).size.width*0.6,
            height: MediaQuery.of(context).size.height*0.09,
            child: Text("Are you sure you want to delete this group?",
                style: TextStyle(
                    color: Colors.blueGrey[30], fontSize: 20, fontWeight: FontWeight.bold))
          ),
          actions: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.08,
                child: RaisedButton(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: Colors.lightBlueAccent,
                    child: Text('No',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    )),
                    onPressed: (){
                      Navigator.of(context).pop(false);
                    }
                )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.1,
              height: MediaQuery.of(context).size.height*0.08,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.08,
                child: RaisedButton(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: Colors.lightBlueAccent,
                    child: Text('Yes',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                    )),
                    onPressed: (){
                      Navigator.of(context).pop(true);
                    }
                )
            )]
      );
    });
  }
  Future<List>createGroupDialog(BuildContext context){
    TextEditingController customController1 = TextEditingController();
    TextEditingController customController2 = TextEditingController();
    TextEditingController customController3 = TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Group ID, \n\nGroup Name, \n\nMembers(separated by ',') : "),
        content: SizedBox(
          width: MediaQuery.of(context).size.width*0.6,
          height: MediaQuery.of(context).size.height*0.22,
          child: Column(
            children: <Widget>[
            TextField(
              controller:customController1,
            ),
            TextField(
              controller:customController2,
            ),
            TextField(
              controller:customController3,
            ),
            ]
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width*0.3,
            height: MediaQuery.of(context).size.height*0.08,
            child: RaisedButton(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white)),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              color: Colors.lightBlueAccent,
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                  )),
              onPressed: (){
                Navigator.of(context).pop();
              }
            )
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.1,
            height: MediaQuery.of(context).size.height*0.08,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.3,
            height: MediaQuery.of(context).size.height*0.08,
            child: RaisedButton(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white)),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            textColor: Colors.white,
            color: Colors.lightBlueAccent,
            child: Text('Confirm',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                )),
            onPressed: (){
              Navigator.of(context).pop([customController1?.text.toString(),
                customController2?.text.toString(),
                customController3?.text.toString().split(",")]);
            }
              )
          )]
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(
          "Student Group", Colors.blue[600], Colors.grey[50]
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.75,
            child: RefreshIndicator(
              key: refreshKey,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index){
                    indexOfDeleted = index;
                    return Card(
                      child: ListTile(
                        onTap: (){
                          passingIndex(index);
                        },
                        contentPadding: EdgeInsets.fromLTRB(78, 0, 0, 0),
                        title: Text(studentGroups[index].groupId + '   ' +
                            studentGroups[index].groupName + '   ' +
                            'No. of members: ' +
                            studentGroups[index].members.length.toString())
                      )
                    );
                  }),
              onRefresh: refreshList,
            ),
          ),
        SizedBox(height: 10),
        SizedBox(
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height*0.1,
          child: RaisedButton(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white)),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            textColor: Colors.white,
            color: Colors.blue[700],
            onPressed: (){
              createGroupDialog(context).then((onValue){
                studentGroups.add(StudentGroup(groupName: onValue[0], groupId: onValue[1], members: onValue[2]));
              }
              );
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.group_add,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Add a Group",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))
                ]),
            ),
        )
        ]
      )
    );
  }
}
