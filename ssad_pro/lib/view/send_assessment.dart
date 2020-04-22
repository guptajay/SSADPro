/**
 * This class has the logic to send assessments
 * from one student to another.
 * 
 * @author Ritik Bhatia
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/text_field.dart';
import 'package:ssadpro/view/questions.dart';
import 'background.dart';

class SendAssessment extends StatefulWidget {
  State createState() => SendAssessmentStage();
}

class SendAssessmentStage extends State<SendAssessment> {
  final formKey = GlobalKey<FormState>();
  var _course = TextEditingController();
  var _topic = TextEditingController();
  var _dueDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(
          "Send Assignment", Colors.brown[700], Colors.amberAccent[100]),
      backgroundColor: Colors.grey[50],
      body: Container(
          decoration: Background.getBackground(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    FadeAnimation(
                      0.5,
                      Icon(
                        Icons.description,
                        color: Color(0xffF47217),
                        size: 200,
                      ),
                    ),
                    FadeAnimation(
                        0.7,
                        Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                            child: Container(
                                child: Center(
                                    child: const DecoratedBox(
                                      decoration: const BoxDecoration(
                                        color: Color(0xffFFF484),
                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: Text('Send an Assignment below',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffF47217),
                                            backgroundColor: Colors.transparent,
                                          )
                                      ),
                                    ),
                                )
                            ))),
                    FadeAnimation(
                      0.7,
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(255, 255, 255, .5),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(children: <Widget>[
                                  TextFields.getTextField(
                                      _course,
                                      TextInputType.text,
                                      TextInputAction.done,
                                      "Course"),
                                  TextFields.getTextField(
                                      _topic,
                                      TextInputType.text,
                                      TextInputAction.done,
                                      "Topic"),
                                  TextFields.getTextField(
                                      _dueDate,
                                      TextInputType.datetime,
                                      TextInputAction.done,
                                      "Due Date (DD/MM/YYYY)"),
                                ])),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Questions(
                                          course: _course.text,
                                          topic: _topic.text,
                                          dueDate: _dueDate.text)),
                                );
                              },
                              color: Color(0xffF47217),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
