import 'package:ssad_start/mcqpage.dart';
import 'package:flutter/material.dart';
import 'package:ssad_start/fibpage.dart';
import 'package:ssad_start/matchpage.dart';
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
        appBar: AppBar(
            centerTitle: true,
            title: Text("Levels",
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.grey[50],
            brightness: Brightness.light,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.grey[50], //change your color here
            ),
            bottom: PreferredSize(
                child: Container(
                  color: Colors.blue[600],
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(4.0))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 120),
           
            Expanded(
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
                padding: EdgeInsets.only(left:40,right:40),
                child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: Colors.blue[700],
                          onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => MCQPage()),
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
            
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left:40,right:40),
                child: SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      textColor: Colors.white,
                      color: Colors.blue[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => FIBPage()),
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
            
            Expanded(
              child: Container(

                padding: EdgeInsets.only(left:40,right:40),
                child: SizedBox(


                    width: 300.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      textColor: Colors.white,
                      color: Colors.blue[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => MatchPage()),
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
        ));
  }


}
