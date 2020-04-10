import 'package:flutter/material.dart';
import 'compete_mode_chooseq.dart';
import 'mcqpage.dart';

class CompeteMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BodyLayout();
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new RaisedButton(
        color: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MCQPage("quest", "1", "2", "3", "4", 4)),
          );
        },
        child: const Text(
          'Play a Quiz to Compete',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        splashColor: Colors.yellow[200],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black),
        ),
        padding: EdgeInsets.all(30), //distance of all the sides to the //child
      ),
      SizedBox(height: 32),
      new RaisedButton(
        color: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QCheckList()),
          );
        },
        child: const Text(
          'Create your own Quiz',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        splashColor: Colors.yellow[200],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black),
        ),
        padding: EdgeInsets.fromLTRB(
            40, 30, 40, 30), //distance of all the sides to the //child
      )
    ]));

    child:
    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new RaisedButton(
        color: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MCQPage("quest", "1", "2", "3", "4", 4)),
          );
        },
        child: const Text(
          'Play a Quiz to Compete',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        splashColor: Colors.yellow[200],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black),
        ),
        padding: EdgeInsets.all(30), //distance of all the sides to the //child
      ),
      SizedBox(height: 32),
      new RaisedButton(
        color: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QCheckList()),
          );
        },
        child: const Text(
          'Create your own Quiz',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        splashColor: Colors.yellow[200],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black),
        ),
        padding: EdgeInsets.fromLTRB(
            40, 30, 40, 30), //distance of all the sides to the //child
      )
    ]);
  }
}
