import 'package:flutter/material.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/compete_mcq.dart';
import 'package:ssadpro/controller/mcq_generator.dart';

class CheckChallenged extends StatefulWidget {
  CheckChallengedState createState() => CheckChallengedState();
}

class CheckChallengedState extends State<CheckChallenged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Compete Mode", Colors.blue[600], Colors.grey[50]),
        backgroundColor: Colors.grey[50],
        body: GestureDetector(
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
                        height: 70,
                      ),
                      FadeAnimation(
                        0.5,
                        Icon(
                          Icons.compare_arrows,
                          color: Colors.blue[600],
                          size: 200,
                        ),
                      ),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: Container(
                                  child: Center(
                                      child: Text(
                                          "You have been challenged by Jay!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue[400])))))),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Column(children: <Widget>[])),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                      height: 50,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      onPressed: () {
                                        List<String> question =
                                            GenerateMCQ().question(99, 99);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CompeteMCQPage(
                                                      question[0],
                                                      question[1],
                                                      question[2],
                                                      question[3],
                                                      question[4],
                                                      int.parse(question[5]),
                                                      99,
                                                      99,
                                                      1,
                                                      0,
                                                      "user.email"),
                                            ));
                                      },
                                      color: Colors.blue[600],
                                      child: Center(
                                          child: Text(
                                        "Complete Challenge",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )))
                                ],
                              )))
                    ]))))));
  }
}
