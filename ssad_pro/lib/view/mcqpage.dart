import 'package:flutter/material.dart';
import 'package:ssadpro/controller/txt_handle.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/mcq_boxes.dart';
import 'package:flutter/cupertino.dart';

class MCQPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState(question,option1,option2,option3,option4,correctAnswer);

  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int correctAnswer;


  MCQPage(this.question, this.option1,this.option2,this.option3,this.option4,this.correctAnswer );
}

class _InputPageState extends State<MCQPage> {
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


  _InputPageState(this.question, this.option1,this.option2,this.option3,this.option4,this.correctAnswer );

  @override
  Widget build(BuildContext context) {
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
                            correctAnswer == 1
                                ? createRecord("Right", "mcq")
                                : createRecord("Wrong", "mcq");
                            await new Future.delayed(
                                const Duration(seconds: 2));
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => MCQPage("quest","1","2","3","4",1)),
                            );
                          },
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  
                                  Text(option1,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
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
                            correctAnswer == 2
                                ? createRecord("Right", "mcq")
                                : createRecord("Wrong", "mcq");
                            await new Future.delayed(
                                const Duration(seconds: 2));
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => MCQPage("quest","1","2","3","4",2)),
                            );
                          },
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  
                                  Text(option2,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
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
                            correctAnswer == 3
                                ? createRecord("Right", "mcq")
                                : createRecord("Wrong", "mcq");
                            await new Future.delayed(
                                const Duration(seconds: 2));
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => MCQPage("quest","1","2","3","4",3)),
                            );
                          },
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  
                                  Text(option3,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
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
                            correctAnswer == 4
                                ? createRecord("Right", "mcq")
                                : createRecord("Wrong", "mcq");
                            await new Future.delayed(
                                const Duration(seconds: 2));
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => MCQPage("quest","1","2","3","4",4)),
                            );
                          },
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  
                                  Text(option4,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                        )),
                  ),
                ),
              ],
            )),
            RaisedButton(
              child: Text('Retrieve Data'),
              onPressed: () async {
                print(await getData("mcq"));
                print("____________________________________________");
              },
            ),
            RaisedButton(
              child: Text('Delete Data'),
              onPressed: () {
                deleteData("mcq");
              },
            )
          ],
        ));
  }
}
