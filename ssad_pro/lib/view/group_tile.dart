import 'package:flutter/material.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/card.dart';
import 'package:ssadpro/view/successful.dart';

class GroupTile extends StatelessWidget {
  GroupTile(
      {Key key,
      this.allStudent,
      this.user,
      this.course,
      this.topic,
      this.dueDate,
      this.questions,
      this.answers});
  final StudentUser user;
  final String course;
  final String topic;
  final String dueDate;
  final List<String> questions;
  final List<String> answers;
  final List<StudentUser> allStudent;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardView.getCard(
          context,
          Sucessfull(
            allStudent: allStudent,
            user: user,
            course: course,
            topic: topic,
            dueDate: dueDate,
            questions: questions,
            answers: answers,
          ),
          user.group, //take note
          Icons.group),
      SizedBox(height: 20),
    ]);
  }
}
