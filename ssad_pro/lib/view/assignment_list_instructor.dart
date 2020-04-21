/**
 * This class implements logic to fetch the list of
 * assignements done by a student.
 *
 * @author Jay Gupta
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/assignment_tile.dart';

class AssignmentListInstructor extends StatelessWidget {
  AssignmentListInstructor({
    Key key,
    this.status,
  });
  final String status;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamBuilder(
      stream: DatabaseService(email: user.email).getAssignmentSnapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('NO');
        List<List> assessmentList = [];
        snapshot.data.documents.forEach((f)=>{
          if (f['status'] == status)
            assessmentList.add([f,status])
        });
        return new Scaffold(
            body: Container(
              padding: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage("assets/images/space_background.png"),
                      fit: BoxFit.cover
                )
              ),
              child: ListView.builder(
                itemCount: assessmentList.length,
                itemBuilder: (context, index) {
                  return new AssignmentTile(document: assessmentList[index][0], status: assessmentList[index][1], isInstructor: true);
                }
              ),
            ));
      },
    );
  }
}
