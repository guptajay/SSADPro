import 'package:ssadpro/view/mcqpage.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/view/fibpage.dart';
import 'package:ssadpro/view/match_page.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:flutter/cupertino.dart';

class LevelViewPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<LevelViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReusableWidgets.getAppBar(
            "Levels", Colors.blue[600], Colors.grey[50]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 120),
              Center(
                child: Container(
//                decoration: new BoxDecoration(
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey,
//                      blurRadius: 20.0, // has the effect of softening the shadow
//                      spreadRadius: 0.3, // has the effect of extending the shadow
//                      offset: Offset(
//                        1.0, // horizontal, move right 10
//                        1.0, // vertical, move down 10
//                      ),
//                    )
//                  ],
//
//                ),
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Container(
                      child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    textColor: Colors.white,
                    color: Colors.blue[600],
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => MCQPage()),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.assessment,
                            color: Colors.white,
                            size: 60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("MCQ",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ]),
                  )),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: SizedBox(
                      child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    textColor: Colors.white,
                    color: Colors.blue[600],
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => FIBPage()),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.assignment_turned_in,
                            color: Colors.white,
                            size: 60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Fill in the Blanks",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ]),
                  )),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: SizedBox(
                      child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    textColor: Colors.white,
                    color: Colors.blue[600],
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => MatchPage()),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.apps,
                            color: Colors.white,
                            size: 60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Match the Column",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ]),
                  )),
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
        ));
  }
}
