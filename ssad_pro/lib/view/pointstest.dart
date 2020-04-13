import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/grouptest2.dart';


class PointsTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return new StreamBuilder<UserData>(
      stream: DatabaseService(email: user.email).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          List<dynamic> points = userData.points;

          return Text(points[1].toString());
        }
        else
        {
          return Text('No');
        }
      },
    );
  }
}
