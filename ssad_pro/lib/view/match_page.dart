/**
 * This class implements the layout match the column 
 * type of questions
 *
 * @author Divyesh Mundhra
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/controller/drag_objects.dart';
import 'package:ssadpro/controller/dynamic_predictor.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/mcq_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/view/world_ui.dart';
import 'mcq_boxes.dart';
import 'package:ssadpro/model/user.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/match_generator.dart';

class MatchPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState(
      question1,
      question2,
      question3,
      question4,
      option1,
      option2,
      option3,
      option4,
      world,
      section,
      attempt,
  section_state);

  final String question1;
  final String question2;
  final String question3;
  final String question4;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int world;
  final int section;
  final int attempt;
  final int section_state;

  MatchPage(
      this.question1,
      this.question2,
      this.question3,
      this.question4,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.world,
      this.section,
      this.attempt,
      this.section_state);
}

class _InputPageState extends State<MatchPage> {
  final String question1;
  final String question2;
  final String question3;
  final String question4;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int world;
  final int section;
  final int attempt;
  final int section_state;

  _InputPageState(
      this.question1,
      this.question2,
      this.question3,
      this.question4,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.world,
      this.section,
      this.attempt,
      this.section_state);

  final myController = TextEditingController();
  double width = 200.0, height = 60.0;
  Offset position;
  Color abc = Colors.grey[200];
  String text1 = "Answer 1";
  String text2 = "Answer 2";
  String text3 = "Answer 3";
  String text4 = "Answer 4";

  @override
  void initState() {
    super.initState();
    position = Offset(20.0, 440);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: ReusableWidgets.getAppBar(
                "Match the Column", Colors.blue[600], Colors.grey[50]),
            body: Container(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: SingleChildScrollView(
                      child: Container(
                        height: 720,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(height: 40),
                              Expanded(
                                child: Table(
                                  border: TableBorder.all(
                                    color: Colors.blue,
                                  ),
                                  children: [
                                    TableRow(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text(question1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text(question2,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text(question3,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text(question4,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ])
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: SizedBox(
                                    width: 55.0,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side:
                                              BorderSide(color: Colors.white)),
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      textColor: Colors.white,
                                      color: Colors.blue[600],
                                      onPressed: () {
                                        if (attempt < 3) {
                                          List<String> match = GenerateMatch()
                                              .question(
                                                  world, section, attempt + 1, DynamicPrediction().dynamicprediction(section_state, 1));
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
                                                    attempt + 1,
                                                    DynamicPrediction().dynamicprediction(section_state, 1))),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    WorldUI(1, world)),
                                          );
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
                                                width: 0,
                                              ),
                                              Text("Confirm Answer",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 10),
                            ]),
                      ),
                    )))),
        DragBox(Offset(10.0, 540.0), option1, Colors.blueAccent),
        DragBox(Offset(220.0, 540.0), option2, Colors.blueAccent),
        DragBox(Offset(10.0, 620.0), option3, Colors.blueAccent),
        DragBox(Offset(220.0, 620.0), option4, Colors.blueAccent),
        MCQBoxes.getTargetBox(abc, text1, 209.0, 149),
        MCQBoxes.getTargetBox(abc, text2, 209.0, 230),
        MCQBoxes.getTargetBox(abc, text3, 209.0, 310),
        MCQBoxes.getTargetBox(abc, text4, 209.0, 390),
      ],
    );
  }
}
