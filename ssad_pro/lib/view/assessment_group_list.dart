/**
 * This class implements logic to fetch the list of
 * groups to which different students belong.
 *
 * @author Jay Gupta
 */

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
    List<String> Groups = new List();
    for (StudentUser i in users) {
      Groups.add(i.group);
    } 
    Groups = Set.of(Groups).toList();
    Groups.sort();
    final List<StudentUser> selecteduser = new List();
    for (String str in Groups) {
      if (str != '0')
        selecteduser.add(StudentUser(group: str));
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            child: new ListView.builder(
              itemCount: selecteduser.length,
              itemBuilder: (context, index) {
                return GroupTile(
                  allStudent: users,
                  user: selecteduser[index],
                  course: widget.course,
                  topic: widget.topic,
                  dueDate: widget.dueDate,
                  questions: widget.questions,
                  answers: widget.answers,
                  color: Colors.deepOrange[400]
                );
              },
            ),
          ),
        ),
      ],
    );
    ;
  }
}
