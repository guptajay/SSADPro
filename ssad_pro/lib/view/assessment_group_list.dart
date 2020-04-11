import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/group_tile.dart';

class AssessmentGroupList extends StatefulWidget {
  @override
  _AssessmentGroupListState createState() => _AssessmentGroupListState();
  AssessmentGroupList(
      {Key key,
      this.course,
      this.topic,
      this.dueDate,
      this.questions,
      this.answers});
  final String course;
  final String topic;
  final String dueDate;
  final List<String> questions;
  final List<String> answers;
}

class _AssessmentGroupListState extends State<AssessmentGroupList> {
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
          return GroupTile(
            user: users[index],
            course: widget.course,
            topic: widget.topic,
            dueDate: widget.dueDate,
            questions: widget.questions,
            answers: widget.answers,
          );
        },
      )))
    ]);
  }
}
