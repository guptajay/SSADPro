/**
 * This class return the page layout displaying
 * all the student groups.
 * 
 * @author Ritik Bhatia
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/view/appbar.dart';

class StudentGroupPage extends StatefulWidget {
  @override
  _StudentGroupState createState() => _StudentGroupState();
}

class _StudentGroupState extends State<StudentGroupPage> {
  Future<bool> passingIndex(var snapshot, int index) async {
    bool isDelete = await deleteGroupDialog(context, snapshot, index);
    if (isDelete) {
      await Firestore.instance
          .runTransaction((Transaction myTransaction) async {
        await myTransaction.delete(snapshot.data.documents[index].reference);
      });
    }
  }

  Future showDetailDialog(BuildContext context, var snapshot, int index) {
    DocumentSnapshot document = snapshot.data.documents[index];
    String course = document['course'];
    String name = document['name'];
    int membersStringLength = document['students'].toString().length;
    int memberListLength = document['students'].length;
    String members;
    if (memberListLength == 0)
      members = 'None';
    else
      members =
          document['students'].toString().substring(1, membersStringLength - 1);

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.amber[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              title: Text(
                  "Course: $course\nGroup: $name\n"
                  "Members: $members",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown[600]
                  )),
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
                        color: Colors.deepOrange[300],
                        child: Text('OK',
                            style: TextStyle(
                                color: Colors.brown[600],
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: MediaQuery.of(context).size.height * 0.05)
              ]);
        });
  }

  Future<bool> deleteGroupDialog(
      BuildContext context, var snapshot, int index) {
    DocumentSnapshot document = snapshot.data.documents[index];
    String course = document['course'];
    String name = document['name'];
    int membersStringLength = document['students'].toString().length;
    int memberListLength = document['students'].length;
    String members;
    if (memberListLength == 0)
      members = 'None';
    else
      members =
          document['students'].toString().substring(1, membersStringLength - 1);

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.amber[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              title: Text(
                  "Course: $course\nGroup: $name\n"
                  "Members: $members",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.brown[600]
                  )),
              content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Text("Are you sure you want to delete this group?",
                      style: TextStyle(
                          color: Colors.brown[700],
                          fontSize: 18,
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
                        color: Colors.deepOrange[200],
                        child: Text('No',
                            style: TextStyle(
                                color: Colors.brown[600],
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
                        color: Colors.deepOrange[400],
                        child: Text('Yes',
                            style: TextStyle(
                                color: Colors.brown[600],
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        }))
              ]);
        });
  }

  Future<Map<String,dynamic>> addMembersDialog(
      BuildContext context, var groupSnapshot, int index) async{
    List<String> listOfSelectedUsers = [];
    DocumentSnapshot groups =
    groupSnapshot.data.documents[index];
    Map<String, dynamic> stateOfAllUsers = {};
    QuerySnapshot allUsersDocs = await Firestore.instance.collection('Users').getDocuments();
    allUsersDocs.documents.forEach((doc) => {
      stateOfAllUsers.addAll({doc['name']: false})
    });

    for (String j in groups['students']){
      stateOfAllUsers[j] = true;
    }
//    for (String groupMember in usersOfGroup){
//      if (doc['name'] == groupMember){
//      Firestore.instance
//          .collection('Users')
//          .document('${doc['email']}')
//          .updateData({'group': groupName})
//      }
//    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.amber[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.5,
                child: StreamBuilder(
                  stream: Firestore.instance.collection('Users').snapshots(),
                  builder: (context, userSnapshot) {
                    if (!userSnapshot.hasData) return const Text('Loading...');
                    final lengthOfSnapshot = userSnapshot.data.documents.length;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: lengthOfSnapshot,
                        itemBuilder: (context, indexOfUsers) {
                          DocumentSnapshot users =
                              userSnapshot.data.documents[indexOfUsers];
                          bool isChecked = false;
                          String studentName = users['name'];

                          for (String memberName in groups['students']) {
                            if (memberName == studentName) {
                              isChecked = true;
                            }
                          }
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            elevation: 0,
                            color: Colors.deepOrange[300],
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  StatefulBuilder(
                                    builder: (context, _setState) =>
                                        CheckboxListTile(
                                            title: Row(
                                              children: <Widget>[
                                                Icon(Icons.person,
                                                color: Colors.brown[600]),
                                                SizedBox(width: 15.0),
                                                Text(studentName,
                                                    style: TextStyle(
                                                        color: Colors.brown[700],
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            onChanged: (newValue) {
                                              _setState(() => isChecked =
                                                  newValue ? true : false);
                                              if (isChecked) {
                                                stateOfAllUsers[studentName] = true;
                                              } else {
                                                stateOfAllUsers[studentName] = false;
                                              }
                                            },
                                            value: isChecked),
                                  ),
                                ]),
                          );
                        });
                  },
                ),
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
                        color: Colors.deepOrange[200],
                        child: Text('Cancel',
                            style: TextStyle(
                                color: Colors.brown[600],
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
                        color: Colors.deepOrange[400],
                        child: Text('Confirm',
                            style: TextStyle(
                                color: Colors.brown[600],
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop(stateOfAllUsers);
                        }))
              ]);
        });
  }

  Future<List> createGroupDialog(BuildContext context) {
    TextEditingController customController1 = TextEditingController();
    TextEditingController customController2 = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.amber[100],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              content: Container(
                color: Colors.amber[100],
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Course ID",
                      labelStyle: TextStyle(
                        color: Colors.brown[800],
                    ),
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
                      labelStyle: TextStyle(
                        color: Colors.brown[800]
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    controller: customController2,
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
                        color: Colors.deepOrange[200],
                        child: Text('Cancel',
                            style: TextStyle(
                                color: Colors.brown[600],
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
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
                        textColor: Colors.brown[600],
                        color: Colors.deepOrange[400],
                        child: Text('Confirm',
                            style: TextStyle(
                                color: Colors.brown[600],
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          try{
                            Navigator.of(context).pop([
                              customController1?.text.toString(),
                              customController2?.text.toString()
                            ]);
                          }
                          catch (e){
                            print(e);
                          }
                        }))
              ]);
        });
  }
  syncUsersGroup(List usersOfGroup, String groupName) async{
    List<List> previousGroup = [[]]; //[[SS1, itsAName]]
    int count = 0;
    QuerySnapshot allUsersDocs = await Firestore.instance.collection('Users').getDocuments();
    for (String groupMember in usersOfGroup){
      allUsersDocs.documents.forEach((doc) async=>{
          if (doc['name'] == groupMember){
            if(!previousGroup[count].contains(doc['group']) || !previousGroup[count].contains(doc['name'])){
              count++,
              previousGroup.add([doc['group'],doc['name']]),
              await Firestore.instance
                  .collection('Users')
                  .document('${doc['email']}')
                  .updateData({'group': groupName})
            }
          }
      });
    }
    previousGroup.removeAt(0);
    int finalCount = 0;
    List<List> finalStudents = [];

    for (List i in previousGroup){
      finalStudents = [];
      QuerySnapshot allGroupsDocs = await Firestore.instance.collection('Groups').getDocuments();
      allGroupsDocs.documents.forEach((f) async =>{
        if(f['name']!=groupName){
          if(f['students'].contains(i[1])){
            finalStudents.add(f['students']),
            finalStudents[finalCount].remove(i[1]),
            await Firestore.instance.collection('Groups').document('${i[0]}').updateData({'students': finalStudents[finalCount]}),
            finalCount++
          }
        }
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Student Group", Colors.brown[700], Colors.amberAccent[100]),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/space_background.png"),
                fit: BoxFit.cover,
//                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(), BlendMode.dstATop)
              ),
          ),
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
                            DocumentSnapshot document =
                                snapshot.data.documents[index];
                            String groupName = document['name'];
                            String course = document['course'];
                            List students = document['students'];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                  side: BorderSide(color: Colors.white)
                              ),
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              elevation: 6.0,
                              color: Colors.deepOrange[400],
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      onTap: () {
                                        showDetailDialog(
                                            context, snapshot, index);
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
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange[100]
                                          )
                                      ),
                                      subtitle: Text(
                                          'Group: ' +
                                              document['name'] +
                                              '   ' +
                                              'Members: ' +
                                              students
                                                  .length
                                                  .toString(),
                                          style: TextStyle(fontSize: 18,
                                          color: Colors.white)),
                                      trailing: Wrap(
                                        spacing: 5,
                                        children: <Widget>[
                                          IconButton(
                                            icon:
                                                Icon(Icons.group_add, size: 40),
                                            onPressed: () {
                                              addMembersDialog(
                                                      context, snapshot, index)
                                                  .then((onValue) async{
                                                if (onValue != null)
                                                  {
                                                    List<String> output = [];
                                                    onValue.forEach((key, value)=>{
                                                      if(value == true){
                                                        output.add(key)
                                                      }
                                                    });
                                                    List output2 = new List.from(output);
                                                    for (String previousStudent in students) {
                                                      output2.remove(previousStudent);
                                                    }
                                                    await DatabaseService().updateGroup(
                                                        course,
                                                        groupName,
                                                        output);
                                                    await syncUsersGroup(output2, groupName);
                                                  }
                                              });
                                            },
                                          ),
                                          IconButton(
                                              icon:
                                                  Icon(Icons.delete, size: 40),
                                              onPressed: () {
                                                passingIndex(snapshot, index);
                                              }), // icon-2
                                        ],
                                      ),
                                    ),
                                  ]),
                            );
                          });
                    }),
              ),
              SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: RaisedButton(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    textColor: Colors.amber[100],
                    color: Colors.deepOrange[400],
                    onPressed: () {
                      createGroupDialog(context).then((onValue) async{
                        if (onValue != null)
                          await DatabaseService().createGroup(onValue[0], onValue[1], []);
                      });
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.group_add,
//                            color: Colors.white,
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
