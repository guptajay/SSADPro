import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/view/card.dart';

class AssignmentTile extends StatelessWidget {
  final DocumentSnapshot document;

  AssignmentTile({this.document, this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardView.getCardNoClickColor(
          document['course'],
          document['topic'],
          document['dueDate'],
          Icons.description,
          ColorSelect.colorValue(status)),
      SizedBox(height: 20),
    ]);
  }
}

class ColorSelect {
  static Color colorValue(String status) {
    if (status == "Active")
      return Colors.green;
    else
      return Colors.redAccent;
  }
}
