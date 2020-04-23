/**
 * This class implements logic to end a test and display
 * the achieved score based on answers inputted.
 *
 *
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/controller/add_compete_score.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/services/database.dart';
import 'dart:math';

import 'package:ssadpro/view/home_page.dart';

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
  int flag = 0;
}

class CompeteEndState extends State<CompeteEnd> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    String userMsg;
    print(widget.isChallenged);
    if (widget.isChallenged == 0) {
      if (widget.flag == 0) {
        widget.flag = 1;
        userMsg = "Challenge to your selected friend sent successfully!";
        DatabaseService db = new DatabaseService(email: user.email);
        var rng = new Random();
        int rand = rng.nextInt(100);
        String challengeName = rand.toString();
        db.sendChallenge(widget.friendEmail, widget.points);
      }
    } else {
      userMsg = "You have successfully completed the challenge!";
      // destroy exisiting document
    }
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Completed", Colors.white, Color(0xff1F3668)),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("assets/images/space.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.70), BlendMode.dstATop)
              )
          ),
          child: GestureDetector(
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
                            color: Color(0xffF2B809),
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
                                                color: Colors.white)))))),
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
                                                      color: Color(0xffF2B809))))),
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
                                                builder: (context) => HomePage(),
                                              ));
                                        },
                                        color: Color(0xffF2B809),
                                        child: Center(
                                            child: Text(
                                          "Back to Home",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 20),
                                        )))
                                  ],
                                )))
                      ]))))),
        ));
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
