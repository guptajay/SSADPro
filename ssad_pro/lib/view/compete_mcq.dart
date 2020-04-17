import 'package:flutter/material.dart';
import 'package:ssadpro/controller/txt_handle.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/compete_end.dart';
import 'package:ssadpro/view/mcq_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/controller/mcq_generator.dart';

class CompeteMCQPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState(
      question,
      option1,
      option2,
      option3,
      option4,
      correctAnswer,
      world,
      section,
      state,
      points,
      email,
      isChallenged,
      friendPoints);

  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int correctAnswer;
  final int world;
  final int section;
  final int state;
  final int points;
  final String email;
  final int isChallenged;
  final int friendPoints;

  CompeteMCQPage(
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.correctAnswer,
      this.world,
      this.section,
      this.state,
      this.points,
      this.email,
      this.isChallenged,
      this.friendPoints);
}

class _InputPageState extends State<CompeteMCQPage> {
  int pressAttention1 = 0;
  int pressAttention2 = 0;
  int pressAttention3 = 0;
  int pressAttention4 = 0;

  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int correctAnswer;
  final int world;
  final int section;
  final int state;
  int points;
  final String email;
  final int isChallenged;
  final int friendPoints;

  _InputPageState(
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.correctAnswer,
      this.world,
      this.section,
      this.state,
      this.points,
      this.email,
      this.isChallenged,
      this.friendPoints);

  @override
  Widget build(BuildContext context) {
    // List<String> fib = GenerateFIB().question(world, section);
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "MCQs", Colors.blue[600], Colors.grey[50]),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 300,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MCQBoxes.getQuestionBox1(question),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 40),
                    child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: correctAnswer == 1
                              ? (pressAttention1 == 1
                                  ? Colors.green[800]
                                  : (pressAttention1 == 2
                                      ? Colors.grey
                                      : Colors.blue[700]))
                              : pressAttention1 == 1
                                  ? Colors.red[800]
                                  : (pressAttention1 == 2
                                      ? Colors.grey
                                      : Colors.blue[700]),
                          onPressed: () async {
                            setState(() {
                              pressAttention1 = 1;
                              pressAttention2 = 2;
                              pressAttention3 = 2;
                              pressAttention4 = 2;
                            });

                            createRecord("Right", "mcq");
                            await new Future.delayed(
                                const Duration(seconds: 2));
                            if (state == 1) {
                              if (correctAnswer == 1) points = 1;
                              List<String> question =
                                  GenerateMCQ().question(99, 100);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteMCQPage(
                                        question[0],
                                        question[1],
                                        question[2],
                                        question[3],
                                        question[4],
                                        int.parse(question[5]),
                                        99,
                                        100,
                                        2,
                                        points,
                                        email,
                                        isChallenged,
                                        friendPoints),
                                  ));
                            } else if (state == 2) {
                              if (correctAnswer == 1) points = points + 1;
                              List<String> question =
                                  GenerateMCQ().question(99, 101);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteMCQPage(
                                        question[0],
                                        question[1],
                                        question[2],
                                        question[3],
                                        question[4],
                                        int.parse(question[5]),
                                        99,
                                        100,
                                        3,
                                        points,
                                        email,
                                        isChallenged,
                                        friendPoints),
                                  ));
                            } else if (state == 3) {
                              if (correctAnswer == 1) points = points + 1;
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteEnd(
                                      points: points,
                                      friendEmail: email,
                                      isChallenged: isChallenged,
                                      friendPoints: friendPoints,
                                    ),
                                  ));
                            }
                          },
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    option1,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.visible,
                                  ))
                                ]),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 40),
                    child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: correctAnswer == 2
                              ? (pressAttention2 == 1
                                  ? Colors.green[800]
                                  : (pressAttention2 == 2
                                      ? Colors.grey
                                      : Colors.blue[700]))
                              : pressAttention2 == 1
                                  ? Colors.red[800]
                                  : (pressAttention2 == 2
                                      ? Colors.grey
                                      : Colors.blue[700]),
                          onPressed: () async {
                            setState(() {
                              pressAttention2 = 1;
                              pressAttention1 = 2;
                              pressAttention3 = 2;
                              pressAttention4 = 2;
                            });

                            createRecord("Right", "mcq");
                            await new Future.delayed(
                                const Duration(seconds: 2));
                            if (state == 1) {
                              if (correctAnswer == 2) points = 1;
                              List<String> question =
                                  GenerateMCQ().question(99, 100);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteMCQPage(
                                        question[0],
                                        question[1],
                                        question[2],
                                        question[3],
                                        question[4],
                                        int.parse(question[5]),
                                        99,
                                        100,
                                        2,
                                        points,
                                        email,
                                        isChallenged,
                                        friendPoints),
                                  ));
                            } else if (state == 2) {
                              if (correctAnswer == 2) points = points + 1;
                              List<String> question =
                                  GenerateMCQ().question(99, 101);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => CompeteMCQPage(
                                          question[0],
                                          question[1],
                                          question[2],
                                          question[3],
                                          question[4],
                                          int.parse(question[5]),
                                          99,
                                          100,
                                          3,
                                          points,
                                          email,
                                          isChallenged,
                                          friendPoints)));
                            } else if (state == 3) {
                              if (correctAnswer == 2) points = points + 1;
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteEnd(
                                        points: points,
                                        friendEmail: email,
                                        isChallenged: isChallenged,
                                        friendPoints: friendPoints),
                                  ));
                            }
                          },
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    option2,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.visible,
                                  ))
                                ]),
                          ),
                        )),
                  ),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 40),
                    child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: correctAnswer == 3
                              ? (pressAttention3 == 1
                                  ? Colors.green[800]
                                  : (pressAttention3 == 2
                                      ? Colors.grey
                                      : Colors.blue[700]))
                              : pressAttention3 == 1
                                  ? Colors.red[800]
                                  : (pressAttention3 == 2
                                      ? Colors.grey
                                      : Colors.blue[700]),
                          onPressed: () async {
                            setState(() {
                              pressAttention3 = 1;
                              pressAttention1 = 2;
                              pressAttention2 = 2;
                              pressAttention4 = 2;
                            });

                            createRecord("Right", "mcq");
                            await new Future.delayed(
                                const Duration(seconds: 2));
                            if (state == 1) {
                              if (correctAnswer == 3) points = 1;
                              List<String> question =
                                  GenerateMCQ().question(99, 100);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteMCQPage(
                                        question[0],
                                        question[1],
                                        question[2],
                                        question[3],
                                        question[4],
                                        int.parse(question[5]),
                                        99,
                                        100,
                                        2,
                                        points,
                                        email,
                                        isChallenged,
                                        friendPoints),
                                  ));
                            } else if (state == 2) {
                              if (correctAnswer == 3) points = points + 1;
                              List<String> question =
                                  GenerateMCQ().question(99, 101);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteMCQPage(
                                        question[0],
                                        question[1],
                                        question[2],
                                        question[3],
                                        question[4],
                                        int.parse(question[5]),
                                        99,
                                        100,
                                        3,
                                        points,
                                        email,
                                        isChallenged,
                                        friendPoints),
                                  ));
                            } else if (state == 3) {
                              if (correctAnswer == 3) points = points + 1;
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteEnd(
                                        points: points,
                                        friendEmail: email,
                                        isChallenged: isChallenged,
                                        friendPoints: friendPoints),
                                  ));
                            }
                          },
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    option3,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.visible,
                                  ))
                                ]),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 40),
                    child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: correctAnswer == 4
                              ? (pressAttention4 == 1
                                  ? Colors.green[800]
                                  : (pressAttention4 == 2
                                      ? Colors.grey
                                      : Colors.blue[700]))
                              : pressAttention4 == 1
                                  ? Colors.red[800]
                                  : (pressAttention4 == 2
                                      ? Colors.grey
                                      : Colors.blue[700]),
                          onPressed: () async {
                            setState(() {
                              pressAttention4 = 1;
                              pressAttention2 = 2;
                              pressAttention3 = 2;
                              pressAttention1 = 2;
                            });

                            createRecord("Right", "mcq");
                            await new Future.delayed(
                                const Duration(seconds: 2));
                            if (state == 1) {
                              if (correctAnswer == 4) points = 1;
                              List<String> question =
                                  GenerateMCQ().question(99, 100);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteMCQPage(
                                        question[0],
                                        question[1],
                                        question[2],
                                        question[3],
                                        question[4],
                                        int.parse(question[5]),
                                        99,
                                        100,
                                        2,
                                        points,
                                        email,
                                        isChallenged,
                                        friendPoints),
                                  ));
                            } else if (state == 2) {
                              if (correctAnswer == 4) points = points + 1;
                              List<String> question =
                                  GenerateMCQ().question(99, 101);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteMCQPage(
                                        question[0],
                                        question[1],
                                        question[2],
                                        question[3],
                                        question[4],
                                        int.parse(question[5]),
                                        99,
                                        100,
                                        3,
                                        points,
                                        email,
                                        isChallenged,
                                        friendPoints),
                                  ));
                            } else if (state == 3) {
                              if (correctAnswer == 4) points = points + 1;
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CompeteEnd(
                                        points: points,
                                        friendEmail: email,
                                        isChallenged: isChallenged,
                                        friendPoints: friendPoints),
                                  ));
                            }
                          },
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    option4,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.visible,
                                  ))
                                ]),
                          ),
                        )),
                  ),
                ),
              ],
            )),
            // RaisedButton(
            //   child: Text('Retrieve Data'),
            //   onPressed: () async {
            //     print(await getData("mcq"));
            //     print("____________________________________________");
            //   },
            // ),
            // RaisedButton(
            //   child: Text('Delete Data'),
            //   onPressed: () {
            //     deleteData("mcq");
            //   },
            // )
          ],
        ));
  }
}
