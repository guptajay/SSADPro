/**
 * This class implements the layout of group tiles.
 *
 *
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupTileTest extends StatelessWidget {
  final DocumentSnapshot document;

  GroupTileTest({this.document});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        child: RaisedButton(
          child: Text(
            document['name'],
          ),
          color: Colors.red,
          onPressed: () {},
        ),
      ),
      SizedBox(height: 20),
    ]);
  }
}
