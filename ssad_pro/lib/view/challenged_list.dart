import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/challenged_tile.dart';

class ChallengedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return new StreamBuilder<QuerySnapshot>(
      stream: DatabaseService(email: user.email).getChallengesSnapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('NO');
        return new Scaffold(
            body: ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return new ChallengedTile(document: document);
          }).toList(),
        ));
      },
    );
  }
}
