/**
 * This class implements layout of 
 * cards of each student whose assessment 
 * details are fetched.
 *
 * @author Ritwik Kanodia
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/view/card.dart';

class AssignmentTile extends StatelessWidget {
  final DocumentSnapshot document;
  final bool isInstructor;
  AssignmentTile({this.document, this.status, this.isInstructor});
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardView.getCardNoClickColor(
          document['course'],
          document['topic'],
          document['dueDate'],
          Icons.description,
          ColorSelect.colorValue(status, isInstructor),
          TextColorSelect.colorValue(isInstructor)),
      SizedBox(height: 20),
    ]);
  }
}
class TextColorSelect {
  static Color colorValue(bool isInstructor) {
    if (isInstructor == false)
      return Colors.white;
    else
      return Colors.brown[700];
  }
}
class ColorSelect {
  static Color colorValue(String status, bool isInstructor) {
    if (status == "Active" && isInstructor == false)
      return Colors.green;
    else if (status == "Active" && isInstructor == true)
      return Colors.lightGreen[400];
    else if (status == "Inactive" && isInstructor == false)
      return Colors.redAccent;
    else
      return Colors.red[300];
  }
}
