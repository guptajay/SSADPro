/**
 * This class implements logic to fetch the list of
 * groups to which different students belong.
 *
 * @author Jay Gupta
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/view/grouptest2.dart';

class GroupListTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: DatabaseService().getGroupsSnapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return new Scaffold(
              body: ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new GroupTileTest(document: document);
            }).toList(),
          ));
        } else {
          return Text('No');
        }
      },
    );
  }
}
