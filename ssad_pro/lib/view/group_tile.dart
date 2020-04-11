import 'package:flutter/material.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/card.dart';
import 'package:ssadpro/view/successful.dart';

class GroupTile extends StatelessWidget {
  final StudentUser user;
  GroupTile(
      {Key key,
      this.user,
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
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardView.getCard(
          context,
          Sucessfull(
            course: course,
            topic: topic,
            dueDate: dueDate,
            questions: questions,
            answers: answers,
          ),
          user.group,
          Icons.group),
      SizedBox(height: 20),
    ]);
  }
}
