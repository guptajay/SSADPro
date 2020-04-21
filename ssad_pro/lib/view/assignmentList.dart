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

class AssignmentList extends StatelessWidget {
  AssignmentList({
    Key key,
    this.status,
  });
  final String status;
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return new StreamBuilder<QuerySnapshot>(
      stream: DatabaseService(email: user.email).getAssignmentSnapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('NO');
        return new Scaffold(
            body: Container(
          padding: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("assets/images/space.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.90), BlendMode.dstATop))),
          child: ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              if (document.data['status'] == status)
                return new AssignmentTile(document: document, status: status);
              else
                return Text('');
            }).toList(),
          ),
        ));
      },
    );
  }
}
