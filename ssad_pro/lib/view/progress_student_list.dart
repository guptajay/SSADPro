/**
 * This class return the list of students whose
 * progress can be viewed by the instructor.
 * 
 * @author Divyesh Mundhra
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/progress_user_tiles.dart';

class ProgressStudentList extends StatefulWidget {
  final Color color;
  @override
  _CompeteFriendListState createState() => _CompeteFriendListState();
  ProgressStudentList({this.color});
}

class _CompeteFriendListState extends State<ProgressStudentList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<StudentUser>>(context) ?? [];
    final List<StudentUser> selected_users = new List(users.length) ?? [];
    return Row(children: <Widget>[
      Expanded(
          child: SizedBox(
              child: new ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ProgressUserTile(
            user: users[index],
            color: widget.color,
          );
        },
      )))
    ]);
  }
}
