/**
 * This class implements logic to end a test and display
 * the achieved score based on answers inputted.
 *
 * @author Jay Gupta
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/controller/add_compete_score.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/compete.dart';
import 'package:ssadpro/controller/database.dart';
import 'dart:math';

class CompeteEnd extends StatefulWidget {
  CompeteEndState createState() => CompeteEndState();
  CompeteEnd(
      {Key key,
      this.points,
      this.friendEmail,
      this.isChallenged,
      this.friendPoints});
  final int isChallenged;
  final int points;
  final String friendEmail;
  final int friendPoints;
}

class CompeteEndState extends State<CompeteEnd> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    String userMsg;
    print(widget.isChallenged);
    if (widget.isChallenged == 0) {
      userMsg = "Challenge to your selected friend sent successfully!";
      DatabaseService db = new DatabaseService(email: user.email);
      var rng = new Random();
      int rand = rng.nextInt(100);
      String challengeName = rand.toString();
      db.sendChallenge(

          widget.friendEmail, widget.points);
    } else {
      userMsg = "You have successfully completed the challenge!";
      // destroy exisiting document
    }
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
                                      child: Text(userMsg,
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
                                    _getResult(widget.isChallenged,
                                        widget.points, widget.friendPoints),
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
                                              builder: (context) => Compete(
                                                isChallenged: 0,
                                              ),
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

_getResult(int isChallenged, int points, int friendPoints) {
  String decision;
  if (friendPoints < points) {
    decision = "You Win!";
  } else if (friendPoints > points) {
    decision = "You Loose!";
  } else {
    decision = "It's a Tie!";
  }
  if (isChallenged == 1) {
    return Column(children: <Widget>[
      Container(
          child: Center(
              child: Text("Friend's Score: " + friendPoints.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[400])))),
      SizedBox(
        height: 20,
      ),
      Container(
          child: Center(
              child: Text(decision,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600])))),
    ]);
  } else {
    return SizedBox(
      height: 0,
    );
  }
}
