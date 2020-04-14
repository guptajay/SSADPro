import 'package:flutter/material.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/controller/add_compete_score.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/compete.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/model/user.dart';

class CompeteEnd extends StatefulWidget {
  CompeteEndState createState() => CompeteEndState();
  CompeteEnd({Key key, this.points});
  final int points;
}

class CompeteEndState extends State<CompeteEnd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Completed", Colors.blue[600], Colors.grey[50]),
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
                      AddCompeteScore(totalPoints: widget.points),
                      SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                        0.5,
                        Icon(
                          Icons.done_all,
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
                                          "Challenge to your selected friend sent successfully!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue[400])))))),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Column(children: <Widget>[
                                    Container(
                                        child: Center(
                                            child: Text(
                                                "Your Score: " +
                                                    widget.points.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue[400])))),
                                  ])),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                      height: 50,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Compete(),
                                            ));
                                      },
                                      color: Colors.blue[600],
                                      child: Center(
                                          child: Text(
                                        "Back to Compete Mode",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )))
                                ],
                              )))
                    ]))))));
  }
}
