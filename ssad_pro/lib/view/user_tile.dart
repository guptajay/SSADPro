/**
 * This class return the layout for each
 * button denoting user list.
 * 
 *
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/select_student_group.dart';

class UserTile extends StatelessWidget {
  final StudentUser user;

  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    Future navigateToSubPage(context, StudentUser user) async {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SelectStudentGroup(user)));
    }

    return Column(children: <Widget>[
      SizedBox(
        child: RaisedButton(
          child: Text(user.email),
          color: Colors.red,
          onPressed: () {
            navigateToSubPage(context, user);
          },
        ),
      ),
      SizedBox(height: 20),
    ]);
  }
}
