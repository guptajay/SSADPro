/**
 * This class return the successful message when 
 * assignment is sent by one student to another.
 * 
 *
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/instructor_dashboard.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/student_user.dart';
import 'background.dart';

class Sucessfull extends StatefulWidget {
  SucessfullState createState() => SucessfullState();
  Sucessfull(
      {Key key,
      this.user,
      this.allStudent,
      this.course,
      this.topic,
      this.dueDate,
      this.questions,
      this.answers});
  final StudentUser user;
  final List<StudentUser> allStudent;
  final String course;
  final String topic;
  final String dueDate;
  final List<String> questions;
  final List<String> answers;
}

class SucessfullState extends State<Sucessfull> {
  @override
  Widget build(BuildContext context) {
    DatabaseService db = new DatabaseService();
    List<StudentUser> students = widget.allStudent;
    List<StudentUser> selectedStudents = new List();

    for (StudentUser i in students) {
      if (i.group == widget.user.group) {
        selectedStudents.add(i);
      }
    }

    for (StudentUser S in selectedStudents) {
      db.createUserAssignmentExt(
          widget.topic,
          S.email,
          widget.topic,
          "Active",
          widget.course,
          widget.questions,
          widget.answers,
          widget.dueDate,
          widget.topic);
    }

    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Successful", Colors.brown[700], Colors.amberAccent[100]),
        backgroundColor: Colors.grey[50],
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                        0.5,
                        Icon(
                          Icons.done_all,
                          color: Color(0xffF47217),
                          size: 200,
                        ),
                      ),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: Container(
                                  child: Center(
                                      child: Text(
                                          "Assessment Sent Successfully!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.brown[700])))))),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Column(children: <Widget>[])),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                      height: 50,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InstructorDashboard()),
                                        );
                                      },
                                      color: Color(0xffF47217),
                                      child: Center(
                                          child: Text(
                                        "Home",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )))
                                ],
                              )))
                    ]))))));
  }
}
