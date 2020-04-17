import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/view/appbar.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List<List> sorting(AsyncSnapshot snapshot){
    List<List> namesAndPoints = [];
    for (int i = 0; i < snapshot.data.documents.length; i++){
      DocumentSnapshot doc = snapshot.data.documents[i];
      List temp = doc['points'];
      namesAndPoints.add([doc['name'], temp[temp.length - 1]]);
    }
    namesAndPoints.sort((a,b)=> b[1].compareTo(a[1]));
    return namesAndPoints;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Student Group", Colors.blue[600], Colors.grey[50]),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 20,
                  child: Container(
                    color: Colors.white
                  )
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                  child: Card(
//                  shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(25.0),
//                  ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    elevation: 0,
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          onTap: () {
                          },
                          leading: Text(
                              "Rank",
                              style:  TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                  color: Colors.blue[600]
                              )
                          ),
                          contentPadding:
                          EdgeInsets.fromLTRB(10, 0, 25, 0),
                          title: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[600]
                                  )),
                            ],
                          ),
                          trailing: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.20,
                            child: Row(
                              children: <Widget>[
                                Text(
                                    'Point',
                                    style: TextStyle(fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[600])
                                )
                              ],
                            ),
                          ),
                        ),

                    ]),
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.90,
                  height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.80,
                  child: StreamBuilder(
                      stream: Firestore.instance.collection('Users').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const Text('Loading...');
                        List<List> nameAndPoints = sorting(snapshot);
                        return ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: nameAndPoints.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 85,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
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
                                          leading: Text(
                                            (index+1).toString(),
                                            style:  TextStyle(
                                                fontSize: 40,
                                                foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 2
                                                ..color = Colors.blue[800],
                                                )
                                          ),

                                          title: Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(
                                              nameAndPoints[index][0],
                                              style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)
                                            ),
                                          ),
                                          trailing: SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.20,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                      'Point: ',
                                                      style: TextStyle(fontSize: 19,
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle: FontStyle.italic,
                                                          color: Colors.black38)
                                                  ),
                                                  Text(
                                                      nameAndPoints[index][1].toString(),
                                                    style: TextStyle(
                                                      fontSize: 27,
                                                      fontWeight: FontWeight.bold,
                                                      fontStyle: FontStyle.italic,
                                                      color: Colors.black
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                      ]),
                                ),
                              );
                            });
                      }
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}