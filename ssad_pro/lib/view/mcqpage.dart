import 'package:flutter/material.dart';
import 'package:ssadpro/controller/txt_handle.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/mcq_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/view/fibpage.dart';
import 'package:ssadpro/controller/fib_generator.dart';

class MCQPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState(question, option1, option2,
      option3, option4, correctAnswer, world, section);

  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int correctAnswer;
  final int world;
  final int section;

  MCQPage(this.question, this.option1, this.option2, this.option3, this.option4,
      this.correctAnswer, this.world, this.section);
}

class _InputPageState extends State<MCQPage> with TickerProviderStateMixin {
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
  AnimationController controller1;
  AnimationController controller2;
  AnimationController controller3;
  AnimationController controller4;
  final int world;
  final int section;

  _InputPageState(this.question, this.option1, this.option2, this.option3,
      this.option4, this.correctAnswer, this.world, this.section);

  @override
  void initState() {
    controller1 = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
    controller2 = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
    controller3 = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
    controller4 = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation1 = Tween(begin: 0.0, end: 5.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller1)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller1.reverse();
            }
          });
    final Animation<double> offsetAnimation2 = Tween(begin: 0.0, end: 5.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller2)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller2.reverse();
            }
          });
    final Animation<double> offsetAnimation3 = Tween(begin: 0.0, end: 5.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller3)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller3.reverse();
            }
          });
    final Animation<double> offsetAnimation4 = Tween(begin: 0.0, end: 5.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller4)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller4.reverse();
            }
          });
    List<String> fib = GenerateFIB().question(world, section);
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
                AnimatedBuilder(
                    animation: offsetAnimation1,
                    builder: (buildContext, child) {
                      if (offsetAnimation1.value < 0.0)
                        print('${offsetAnimation1.value + 8.0}');
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: offsetAnimation1.value + 10.0,
                              right: 10.0 - offsetAnimation1.value),
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
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => FIBPage(
                                              fib[0], fib[1], world, section)),
                                    );
                                  } else {
                                    createRecord("Wrong", "mcq");
                                    controller1.forward(from: 0.0);
                                    await new Future.delayed(
                                        const Duration(seconds: 2));
                                    _showWrongDialog();
                                  }
                                },
                                child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                            child: Text(
                                          option1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.visible,
                                        ))
                                      ]),
                                ),
                              )),
                        ),
                      );
                    }),
                SizedBox(
                  width: 20,
                ),
                AnimatedBuilder(
                    animation: offsetAnimation2,
                    builder: (buildContext, child) {
                      if (offsetAnimation2.value < 0.0)
                        print('${offsetAnimation2.value + 8.0}');
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0 - offsetAnimation2.value,
                              right: 10.0 + offsetAnimation2.value),
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
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => FIBPage(
                                              fib[0], fib[1], world, section)),
                                    );
                                  } else {
                                    createRecord("Wrong", "mcq");
                                    controller2.forward(from: 0.0);
                                    await new Future.delayed(
                                        const Duration(seconds: 2));
                                    _showWrongDialog();
                                  }
                                },
                                child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                            child: Text(
                                          option2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.visible,
                                        ))
                                      ]),
                                ),
                              )),
                        ),
                      );
                    }),
              ],
            )),
            SizedBox(height: 20),
            Expanded(
                child: Row(
              children: <Widget>[
                AnimatedBuilder(
                    animation: offsetAnimation3,
                    builder: (buildContext, child) {
                      if (offsetAnimation3.value < 0.0)
                        print('${offsetAnimation3.value + 8.0}');
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: offsetAnimation3.value + 10.0,
                              right: 10.0 - offsetAnimation3.value),
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
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => FIBPage(
                                              fib[0], fib[1], world, section)),
                                    );
                                  } else {
                                    createRecord("Wrong", "mcq");
                                    controller3.forward(from: 0.0);
                                    await new Future.delayed(
                                        const Duration(seconds: 2));
                                    _showWrongDialog();
                                  }
                                },
                                child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                      );
                    }),
                SizedBox(
                  width: 20,
                ),
                AnimatedBuilder(
                    animation: offsetAnimation4,
                    builder: (buildContext, child) {
                      if (offsetAnimation4.value < 0.0)
                        print('${offsetAnimation4.value + 8.0}');
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: offsetAnimation4.value + 10.0,
                              right: 10.0 - offsetAnimation4.value),
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
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => FIBPage(
                                              fib[0], fib[1], world, section)),
                                    );
                                  } else {
                                    createRecord("Wrong", "mcq");
                                    controller4.forward(from: 0.0);
                                    await new Future.delayed(
                                        const Duration(seconds: 2));
                                    _showWrongDialog();
                                  }
                                },
                                child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                      );
                    }),
              ],
            )),
            SizedBox(height: 20),
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

 //     AnimatedBuilder(
                //         animation: offsetAnimation1,
                //         builder: (buildContext, child) {
                //           if (offsetAnimation1.value < 0.0)
                //             print('${offsetAnimation1.value + 8.0}');
                //           return Expanded(
                //             child: Container(
                //               width: 100,
                //               //padding: EdgeInsets.only(left: 40),
                //               padding: EdgeInsets.only(
                //                   left: offsetAnimation1.value + 10.0,
                //                   right: 10.0 - offsetAnimation1.value),
                //               child: SizedBox(
                //                   width: 300.0,
                //                   child: RaisedButton(
                //                     shape: RoundedRectangleBorder(
                //                         borderRadius: BorderRadius.circular(10.0),
                //                         side: BorderSide(color: Colors.white)),
                //                     padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                //                     textColor: Colors.white,
                //                     color: correctAnswer == 1
                //                         ? (pressAttention1 == 1
                //                             ? Colors.green[800]
                //                             : (pressAttention1 == 2
                //                                 ? Colors.grey
                //                                 : Colors.blue[700]))
                //                         : pressAttention1 == 1
                //                             ? Colors.red[800]
                //                             : (pressAttention1 == 2
                //                                 ? Colors.grey
                //                                 : Colors.blue[700]),
                //                     onPressed: () async {
                //                       setState(() {
                //                         pressAttention1 = 1;
                //                         pressAttention2 = 2;
                //                         pressAttention3 = 2;
                //                         pressAttention4 = 2;
                //                       });
                //                       if (correctAnswer == 1) {
                //                         createRecord("Right", "mcq");
                //                         await new Future.delayed(
                //                             const Duration(seconds: 2));
                //                         Navigator.push(
                //                           context,
                //                           CupertinoPageRoute(
                //                               builder: (context) =>
                //                                   FIBPage("questfib", "answerfib")),
                //                         );
                //                       } else {
                //                         createRecord("Wrong", "mcq");
                //                         controller1.forward(from: 0.0);
                //                         await new Future.delayed(
                //                             const Duration(seconds: 2));
                //                         _showWrongDialog();
                //                       }
                //                     },
                //                     child: Center(
                //                       child: Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.center,
                //                           children: <Widget>[
                //                             Flexible(
                //                               child: Text(option1,textAlign: TextAlign.center,
                //                                   style: TextStyle(
                //                                       fontSize: 25,
                //                                       fontWeight: FontWeight.bold)),
                //                             )
                //                           ]),
                //                     ),
                //                   )),
                //             ),
                //           );
                //         }),