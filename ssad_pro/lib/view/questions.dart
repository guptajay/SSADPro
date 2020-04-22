/**
 * This class returns the layout of questions asked.
 *
 * @author Ritik Bhatia
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/questions_layout.dart';
import 'package:ssadpro/view/group_list.dart';
import 'background.dart';

class Questions extends StatefulWidget {
  Questions({Key key, this.course, this.topic, this.dueDate});
  final String course;
  final String topic;
  final String dueDate;
  State createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  final formKey = GlobalKey<FormState>();
  var _q1 = TextEditingController();
  var _a1 = TextEditingController();
  var _q2 = TextEditingController();
  var _a2 = TextEditingController();
  var _q3 = TextEditingController();
  var _a3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Enter Questions", Colors.brown[700], Colors.amberAccent[100]),
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
                          child: Column(children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          0.5,
                          Icon(
                            Icons.question_answer,
                            color: Color(0xffF47217),
                            size: 120,
                          ),
                        ),
                        FadeAnimation(
                            0.7,
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                                child: Container(
                                    child: Center(
                                        child: Text(
                                            "Enter the Questions & Answers",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.brown[700])))))),
                        FadeAnimation(
                            0.7,
                            Padding(
                                padding: EdgeInsets.all(30.0),
                                child: Column(
                                  children: <Widget>[
                                    QuestionLayout.getCard(
                                        _q1, _a1, "Question 1", "Answer 1"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    QuestionLayout.getCard(
                                        _q2, _a2, "Question 2", "Answer 2"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    QuestionLayout.getCard(
                                        _q3, _a3, "Question 3", "Answer 3"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    MaterialButton(
                                        height: 50,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22.0)),
                                        onPressed: () {
                                          List<String> questions = [
                                            _q1.text,
                                            _q2.text,
                                            _q3.text
                                          ];
                                          List<String> answers = [
                                            _a1.text,
                                            _a2.text,
                                            _a3.text
                                          ];

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => GroupList(
                                                    course: widget.course,
                                                    topic: widget.topic,
                                                    dueDate: widget.dueDate,
                                                    questions: questions,
                                                    answers: answers)),
                                          );
                                        },
                                        color: Color(0xffF47217),
                                        child: Center(
                                            child: Text(
                                          "Next",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        )))
                                  ],
                                )))
                      ]))))),
        ));
  }
}
