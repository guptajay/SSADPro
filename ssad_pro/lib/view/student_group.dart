import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/Student.dart';
import 'package:ssadpro/model/StudentGroup.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/login.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/user_list.dart';

class StudentGroupPage extends StatefulWidget {
  @override
  _StudentGroupState createState() => _StudentGroupState();
}

class _StudentGroupState extends State<StudentGroupPage> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  int indexOfDeleted;
//  Future writeStudentGroup(Map<String, dynamic> studentGroup) async {
//    return await Firestore.instance.runTransaction((transaction) async {
//      await transaction.set(
//          Firestore.instance
//              .document('/Users/'),
//          json.encode(studentGroup));
//    });
//  }

  static List<StudentGroup> studentGroups = [
    StudentGroup(
        groupId: 'CZ1001',
        groupName: 'SS2',
        members: ['Jay Gupta', 'Ritik', 'Mac']),
    StudentGroup(
        groupId: 'CZ1001',
        groupName: 'SS3',
        members: ['Yusuf', 'Soham', 'Arduc']),
    StudentGroup(
        groupId: 'CZ1001',
        groupName: 'SS4',
        members: ['Divyesh', 'Arjun', 'Gaurav']),
    StudentGroup(
        groupId: 'CZ1002',
        groupName: 'TS1',
        members: ['Divyesh', 'Soham', 'Yusuf']),
    StudentGroup(
        groupId: 'CZ1002',
        groupName: 'SSP1',
        members: ['Arjun', 'Yusuf', 'Jay Gupta']),
    StudentGroup(
        groupId: 'CZ1002',
        groupName: 'TS2',
        members: ['Ritwik', 'Ritik', 'Mac']),
    StudentGroup(
        groupId: 'CZ1002',
        groupName: 'TS3',
        members: ['Chean', 'Jay', 'Arduc']),
    StudentGroup(
        groupId: 'CZ2002',
        groupName: 'SS1',
        members: ['Chean', 'Ritik', 'Yusuf']),
    StudentGroup(
        groupId: 'CZ2002',
        groupName: 'SS2',
        members: ['Ritwik', 'Arjun', 'Yusuf']),
    StudentGroup(
        groupId: 'CZ2002',
        groupName: 'SS3',
        members: ['Arduc', 'Divyesh', 'Soham']),
    StudentGroup(
        groupId: 'CZ1005',
        groupName: 'SS1',
        members: ['Mac', 'Jay Gupta', 'Gaurav']),
    StudentGroup(
        groupId: 'CZ1005',
        groupName: 'SS2',
        members: ['Divyesh', 'Jay', 'Soham'])
  ];
  List<StudentGroup> list = studentGroups;
  Future refreshList() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      list = studentGroups;
    });
  }

  Future<bool> passingIndex(var snapshot, int index) async{
    bool isDelete = await deleteGroupDialog(context, snapshot, index);
    if (isDelete){
      await Firestore.instance.runTransaction((Transaction myTransaction) async {
        await myTransaction.delete(snapshot.data.documents[index].reference);
      });
    }
  }

  Future<bool> deleteGroupDialog(BuildContext context, var snapshot, int index) {
    DocumentSnapshot document = snapshot.data.documents[index];
    String course = document['course'];
    String name = document['name'];
    int membersStringLength = document['students'].toString().length;
    String members = document['students'].toString().substring(1,membersStringLength-1);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(
                  "Course: $course\nGroup: $name\n"
                  "Members: $members",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Text("Are you sure you want to delete this group?",
                      style: TextStyle(
                          color: Colors.blueGrey[30],
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
              actions: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        color: Colors.blue[600],
                        child: Text('No',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        })),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        color: Colors.blue[600],
                        child: Text('Yes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        }))
              ]);
        });
  }

  Future<List> createGroupDialog(BuildContext context) {
    TextEditingController customController1 = TextEditingController();
    TextEditingController customController2 = TextEditingController();
    TextEditingController customController3 = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Course ID",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    controller: customController1,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Group ID",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    controller: customController2,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Members (separated by ',')",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    controller: customController3,
                  ),
                ]),
              ),
              actions: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        color: Colors.blue[600],
                        child: Text('Cancel',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        textColor: Colors.white,
                        color: Colors.blue[600],
                        child: Text('Confirm',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop([
                            customController1?.text.toString(),
                            customController2?.text.toString(),
                            customController3?.text.toString().split(",")
                          ]);
                        }))
              ]);
        });
  }
//  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
//    print("hello");
//    print(document['name']);
//
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Student Group", Colors.blue[600], Colors.grey[50]),
        body: Container(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.75,
                child: StreamBuilder(
                  stream: Firestore.instance.collection('Groups').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');

                    return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document = snapshot.data.documents[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            elevation: 0,
                            color: Colors.grey[300],
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    onTap: () {

                                    },
                                    leading: Icon(
                                      Icons.group,
                                      size: 60,
                                    ),
                                    isThreeLine: true,
                                    contentPadding:
                                    EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    title: Text(
                                        'Course: ' + document['course'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        'Group: ' + document['name'] +
                                            '   ' +
                                            'Members: ' + document['students'].length.toString(),
                                        style: TextStyle(fontSize: 18)),
                                    trailing: Wrap(
                                      spacing: 5, // space between two icons
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                          Icons.group_add,
                                          size: 40),
                                          onPressed:(){

                                          } ,
                                        ), // icon-1
                                        IconButton(
                                          icon: Icon(
                                              Icons.delete,
                                          size: 40),
                                          onPressed: (){
                                            passingIndex(snapshot, index);
                                          }
                                        ), // icon-2
                                      ],
                                    ),
                                  ),

                                ]),
                          );

                        });
                  }
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: RaisedButton(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    textColor: Colors.white,
                    color: Colors.blue[600],
                    onPressed: () {
                      createGroupDialog(context).then((onValue) {
                        studentGroups.add(StudentGroup(
                            groupName: onValue[0],
                            groupId: onValue[1],
                            members: onValue[2]));
                      });
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
                ),
              )
            ]),
          ),
        ));

  }
}






//Listing all the users
//
//import 'package:ssadpro/model/student_user.dart';
//import 'package:flutter/material.dart';
//
//class UserTile extends StatelessWidget {
//
//  final StudentUser user;
//  UserTile({ this.user });
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.only(top: 8.0),
//      child: Card(
//        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
//        child: ListTile(
//          leading: CircleAvatar(
//            radius: 25.0,
//            backgroundColor: Colors.brown,
//          ),
//          title: Text(.name),
//          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
//        ),
//      ),
//    );
//  }
//}



//class StudentGroupPage extends StatelessWidget {
//  final AuthService _auth = AuthService();
//  @override
//  Widget build(BuildContext context) {
//    return  StreamProvider<List<StudentUser>>.value(
//    value: DatabaseService().users,
//    child: Scaffold(
//    body: UserList(), //UserList() Prints all the registered users of the application
//    )
//    );
//  }
//}
