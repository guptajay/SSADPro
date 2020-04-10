import 'package:flutter/material.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/model/Instructor.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/instructor_dashboard.dart';
import 'package:ssadpro/view/text_field.dart';
import 'package:ssadpro/view/questions.dart';

class Sucessfull extends StatefulWidget {
  SucessfullState createState() => SucessfullState();
  Sucessfull(
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

class SucessfullState extends State<Sucessfull> {
  @override
  Widget build(BuildContext context) {
    print(widget.course);
    print(widget.topic);
    print(widget.dueDate);
    print(widget.questions);
    print(widget.answers);

    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Successful", Colors.blue[600], Colors.grey[50]),
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
                          color: Colors.blue[600],
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
                                              color: Colors.blue[400])))))),
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
                                      color: Colors.blue[600],
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
