import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/view/card.dart';

class ChallengedTile extends StatelessWidget {
  final DocumentSnapshot document;

  ChallengedTile({this.document});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardView.getCardChallenged(
          context,
          document['challenger_email'],
          document['challenger_points'],
          Icons.supervised_user_circle,
          Colors.blue[400],
          document['challenger_email'],
          int.parse(document['challenger_points'])),
      SizedBox(height: 20),
    ]);
  }
}
