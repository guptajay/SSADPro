import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/user_list.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/assessment_group_list.dart';

class GroupList extends StatelessWidget {
  GroupList(
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
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<StudentUser>>.value(
        value: DatabaseService().users,
        child: Scaffold(
            appBar: ReusableWidgets.getAppBar(
                "Select Group", Colors.blue[600], Colors.grey[50]),
            body: Scaffold(
                body: Container(
                    decoration: BoxDecoration(),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 100,
                              child: Icon(
                                Icons.public,
                                color: Colors.blue[600],
                                size: 120,
                              ),
                            ),
                            Container(
                                child: Stack(
                              children: <Widget>[
                                Positioned(
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.70,
                                        margin: EdgeInsets.only(
                                            top: 20, bottom: 30),
                                        child: Center(
                                            child: Text(
                                                "Select a Student Group to send the Assessment",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color:
                                                        Colors.blue[600]))))),
                              ],
                            )),
                            Expanded(
                                child: AssessmentGroupList(
                                    course: course,
                                    topic: topic,
                                    dueDate: dueDate,
                                    questions: questions,
                                    answers: answers))
                          ]),
                    ))
                //UserList() Prints all the registered users of the application
                )));
  }
}
