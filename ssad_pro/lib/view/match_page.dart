import 'package:flutter/material.dart';
import 'package:ssadpro/controller/drag_objects.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/mcq_boxes.dart';
import 'package:ssadpro/view/section.dart';
import 'package:flutter/cupertino.dart';
import 'mcq_boxes.dart';
import 'package:ssadpro/view/section.dart';

class MatchPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<MatchPage> {
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
                        height: 600,
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
                                            child: Text('Question 1',
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
                                            // child: Text('Option 1',
                                            //     style: TextStyle(
                                            //         fontSize: 25,
                                            //         fontWeight: FontWeight.bold,
                                            //         color: Colors.blue)),
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
                                            child: Text('Question 2',
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
                                            child: Text('Question 3',
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
                                            child: Text('Question 4',
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
                                        Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        SectionUI()),
                              );
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
        DragBox(Offset(10.0, 440.0), 'Option 1', Colors.blueAccent),
        DragBox(Offset(220.0, 440.0), 'Option 2', Colors.blueAccent),
        DragBox(Offset(10.0, 520.0), 'Option 3', Colors.blueAccent),
        DragBox(Offset(220.0, 520.0), 'Option 4', Colors.blueAccent),
        MCQBoxes.getTargetBox(abc, text1, 209.0, 109),
        MCQBoxes.getTargetBox(abc, text2, 209.0, 189),
        MCQBoxes.getTargetBox(abc, text3, 209.0, 269),
        MCQBoxes.getTargetBox(abc, text4, 209.0, 349),
      ],
    );
  }
}
