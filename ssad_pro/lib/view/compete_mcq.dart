import 'package:flutter/material.dart';
import 'package:ssadpro/controller/txt_handle.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/assessment_history.dart';
import 'package:ssadpro/view/mcq_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/view/home_page.dart';
import 'package:ssadpro/controller/mcq_generator.dart';

class CompeteMCQPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState(question, option1, option2,
      option3, option4, correctAnswer, world, section, state);

  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int correctAnswer;
  final int world;
  final int section;
  final int state;

  CompeteMCQPage(this.question, this.option1, this.option2, this.option3,
      this.option4, this.correctAnswer, this.world, this.section, this.state);
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

  _InputPageState(this.question, this.option1, this.option2, this.option3,
      this.option4, this.correctAnswer, this.world, this.section, this.state);

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
                            if (correctAnswer == 1) {
                              createRecord("Right", "mcq");
                              await new Future.delayed(
                                  const Duration(seconds: 2));
                              if (state == 1) {
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
                                          2),
                                    ));
                              } else if (state == 2) {
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
                                          3),
                                    ));
                              } else if (state == 3) {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => AssessmentHistory(),
                                    ));
                              }
                            } else {
                              createRecord("Wrong", "mcq");
                              _showWrongDialog();
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
                            if (correctAnswer == 2) {
                              createRecord("Right", "mcq");
                              await new Future.delayed(
                                  const Duration(seconds: 2));
                              if (state == 1) {
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
                                          2),
                                    ));
                              } else if (state == 2) {
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
                                          3),
                                    ));
                              } else if (state == 3) {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => AssessmentHistory(),
                                    ));
                              }
                            } else {
                              createRecord("Wrong", "mcq");
                              _showWrongDialog();
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
                            if (correctAnswer == 3) {
                              createRecord("Right", "mcq");
                              await new Future.delayed(
                                  const Duration(seconds: 2));
                              if (state == 1) {
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
                                          2),
                                    ));
                              } else if (state == 2) {
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
                                          3),
                                    ));
                              } else if (state == 3) {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => AssessmentHistory(),
                                    ));
                              }
                            } else {
                              createRecord("Wrong", "mcq");
                              _showWrongDialog();
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
                            if (correctAnswer == 4) {
                              createRecord("Right", "mcq");
                              await new Future.delayed(
                                  const Duration(seconds: 2));
                              if (state == 1) {
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
                                          2),
                                    ));
                              } else if (state == 2) {
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
                                          3),
                                    ));
                              } else if (state == 3) {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => AssessmentHistory(),
                                    ));
                              }
                            } else {
                              createRecord("Wrong", "mcq");
                              _showWrongDialog();
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

  void _showWrongDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Wrong Answer"),
          content: new Text("Give it another try!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
