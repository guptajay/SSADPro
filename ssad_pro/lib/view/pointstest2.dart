/**
 * This class return the list of scores of a student 
 * for compete mode in form of text.
 *
 * @author Ritwik Kanodia
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PointsTest2 extends StatelessWidget {
  final DocumentSnapshot document;
  PointsTest2({this.document});

  @override
  Widget build(BuildContext context) {
    List<dynamic> points = document['points'];
    return Row(children: <Widget>[
      Expanded(
          child: SizedBox(
              height: 200.0,
              child: new ListView.builder(
                itemCount: points.length,
                itemBuilder: (context, index) {
                  return Text(points[index].toString());
                },
              )))
    ]);
  }
}
