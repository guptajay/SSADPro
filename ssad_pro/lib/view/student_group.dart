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
              title: Text(
                  "Course: $course\nGroup: $name\n"
                  "Members: $members",
                  style: TextStyle(
                    fontSize: 20,
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
                        color: Colors.blue[600],
                        child: Text('OK',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.19,
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
              title: Text(
                  "Course: $course\nGroup: $name\n"
                  "Members: $members",
                  style: TextStyle(
                    fontSize: 18,
                  )),
              content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Text("Are you sure you want to delete this group?",
                      style: TextStyle(
                          color: Colors.blueGrey[30],
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

  Future<List> addMembersDialog(
      BuildContext context, var groupSnapshot, int index) {
    List<String> listOfSelectedUsers = [];
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.5,
                child: StreamBuilder(
                  stream: Firestore.instance.collection('Users').snapshots(),
                  builder: (context, userSnapshot) {
                    if (!userSnapshot.hasData) return const Text('Loading...');

                    return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: userSnapshot.data.documents.length,
                        itemBuilder: (context, indexOfUsers) {
                          DocumentSnapshot users =
                              userSnapshot.data.documents[indexOfUsers];
                          bool isChecked = false;
                          String studentName = users['name'];
                          DocumentSnapshot groups =
                              groupSnapshot.data.documents[index];

                          for (String memberName in groups['students']) {
                            if (memberName == studentName) {
                              isChecked = true;
                              listOfSelectedUsers.add(studentName);
                            }
                          }
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
                                  StatefulBuilder(
                                    builder: (context, _setState) =>
                                        CheckboxListTile(
                                            title: Row(
                                              children: <Widget>[
                                                Icon(Icons.person),
                                                SizedBox(width: 15.0),
                                                Text(studentName,
                                                    style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            onChanged: (newValue) {
                                              _setState(() => isChecked =
                                                  newValue ? true : false);
                                              if (isChecked) {
                                                if (!listOfSelectedUsers
                                                    .contains(studentName))
                                                  listOfSelectedUsers
                                                      .add(studentName);
                                              } else {
                                                if (listOfSelectedUsers
                                                    .contains(studentName))
                                                  listOfSelectedUsers
                                                      .remove(studentName);
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
                          Navigator.of(context).pop(listOfSelectedUsers);
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
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.2,
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
                            customController2?.text.toString()
                          ]);
                        }))
              ]);
        });
  }

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
                            DocumentSnapshot document =
                                snapshot.data.documents[index];
                            String groupName = document['name'];
                            String course = document['course'];
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
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          'Group: ' +
                                              document['name'] +
                                              '   ' +
                                              'Members: ' +
                                              document['students']
                                                  .length
                                                  .toString(),
                                          style: TextStyle(fontSize: 18)),
                                      trailing: Wrap(
                                        spacing: 5,
                                        children: <Widget>[
                                          IconButton(
                                            icon:
                                                Icon(Icons.group_add, size: 40),
                                            onPressed: () {
                                              addMembersDialog(
                                                      context, snapshot, index)
                                                  .then((onValue) {
                                                if (onValue != null)
                                                  DatabaseService().updateGroup(
                                                      course,
                                                      groupName,
                                                      onValue);
                                              });
                                            },
                                          ),
                                          IconButton(
                                              icon:
                                                  Icon(Icons.delete, size: 40),
                                              onPressed: () {
                                                passingIndex(snapshot, index);
                                              }),
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
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    textColor: Colors.white,
                    color: Colors.blue[600],
                    onPressed: () {
                      createGroupDialog(context).then((onValue) {
                        DatabaseService()
                            .createGroup(onValue[0], onValue[1], []);
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
