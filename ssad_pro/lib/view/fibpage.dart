/**
 * This class implements the layout of the fill in the blanks
 * question displayed as one of the levels in each section.
 *
 * @author Divyesh Mundhra
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/controller/txt_handle.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/mcq_boxes.dart';
import 'mcq_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/view/match_page.dart';
import 'package:ssadpro/controller/match_generator.dart';
import 'package:ssadpro/controller/fib_generator.dart';

class FIBPage extends StatefulWidget {
  @override
  _InputPageState createState() =>
      _InputPageState(question, answer, world, section, attempt);

  final String question;
  final String answer;
  int world;
  int section;
  int attempt;
  FIBPage(this.question, this.answer, this.world, this.section, this.attempt);
}

class _InputPageState extends State<FIBPage> with TickerProviderStateMixin {
  final myController = TextEditingController();
  AnimationController controller;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  final String question;
  final String answer;
  int confirmButton = 0;
  final int world;
  final int section;
  final int attempt;
  _InputPageState(
      this.question, this.answer, this.world, this.section, this.attempt);

  int firstAttempt = -1; // not yet attempted

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 10.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });
    List<String> match = GenerateMatch().question(world, section, 1);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReusableWidgets.getAppBar(
            "Fill in the Blanks", Colors.blue[600], Colors.grey[50]),
        body: Container(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SingleChildScrollView(
                  child: Container(
                    height: 600,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 100),
                          MCQBoxes.getFibQuestion(question),
                          SizedBox(height: 20),
                          AnimatedBuilder(
                              animation: offsetAnimation,
                              builder: (buildContext, child) {
                                if (offsetAnimation.value < 0.0)
                                  print('${offsetAnimation.value + 8.0}');
                                return Center(
                                  child: Container(
                                    decoration: new BoxDecoration(boxShadow: [
                                      new BoxShadow(
                                        color: Colors.grey[400],
                                        blurRadius: 50.0,
                                      ),
                                    ]),
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: SizedBox(
                                        child: RaisedButton(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side:
                                              BorderSide(color: Colors.white)),
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      textColor: Colors.black,
                                      color: confirmButton == 0
                                          ? Colors.white
                                          : (confirmButton == 1
                                              ? Colors.green[200]
                                              : Colors.red),
                                      //Colors.white,
                                      onPressed: () {},
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left:
                                                  offsetAnimation.value + 15.0,
                                              right:
                                                  15.0 - offsetAnimation.value),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: TextField(
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 30),
                                                        controller:
                                                            myController,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'Enter your answer here...',
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    )),
                                  ),
                                );
                              }),
                          SizedBox(height: 50),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: SizedBox(
                                width: 55.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.white)),
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  textColor: Colors.white,
                                  color: Colors.blue[600],
                                  onPressed: () async {
                                    if (myController.text == answer) {
                                      if (firstAttempt == -1) {
                                        firstAttempt = 1;
                                      }
                                      confirmButton = 1;
                                      createRecord("Correct", "fib");
                                      await new Future.delayed(
                                          const Duration(seconds: 2));
                                      if (attempt < 3) {
                                        List<String> fib = GenerateFIB()
                                            .question(
                                                world, section, attempt + 1);
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) => FIBPage(
                                                  fib[0],
                                                  fib[1],
                                                  world,
                                                  section,
                                                  attempt + 1)),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) => MatchPage(
                                                  match[0],
                                                  match[1],
                                                  match[2],
                                                  match[3],
                                                  match[4],
                                                  match[5],
                                                  match[6],
                                                  match[7],
                                                  world,
                                                  section,
                                                  1)),
                                        );
                                      }
                                    } else {
                                      if (firstAttempt == -1) {
                                        firstAttempt = 0;
                                      }
                                      confirmButton = 2;
                                      createRecord("Wrong", "fib");
                                      controller.forward(from: 0.0);
                                      await new Future.delayed(
                                          const Duration(seconds: 2));
                                      _showWrongDialog();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Confirm Answer",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                  ),
                                )),
                          ),
                          SizedBox(height: 10),
                        ]),
                  ),
                ))));
  }

  void _showWrongDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Wrong Answer"),
          content: new Text("Give it another try!"),
          actions: <Widget>[
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
