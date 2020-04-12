import 'package:flutter/material.dart';
import 'package:ssadpro/controller/txt_handle.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/mcq_boxes.dart';
import 'mcq_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/view/match_page.dart';

class FIBPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState(question, answer);

  final String question;
  final String answer;
  FIBPage(this.question, this.answer);
}

class _InputPageState extends State<FIBPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  final String question;
  final String answer;
  _InputPageState(this.question, this.answer);

  @override
  Widget build(BuildContext context) {
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
                          MCQBoxes.getAnswerBox(myController),
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
                                      createRecord("Correct", "fib");
                                      await new Future.delayed(
                                          const Duration(seconds: 1));
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => MatchPage()),
                                      );
                                    } else {
                                      createRecord("Wrong", "fib");
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
