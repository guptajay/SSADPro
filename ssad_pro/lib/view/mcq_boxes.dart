/**
 * This class implements the layout of some components
 * which have been reused in many classes of the app.
 *
 * @author Jay Gupta
 */

import 'package:flutter/material.dart';

class MCQBoxes {
  static getQuestionBox1(String question) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: SizedBox(
          width: 300.0,
          child: RaisedButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.white)),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            textColor: Colors.white,
            color: Colors.blue[800],
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 60),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Text(
                      question,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.visible,
                    ))
                  ]),
            ),
          )),
    );
  }

  static getFibQuestion(String ques) {
    return Expanded(
      child: Container(
          height: 250,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            width: 300.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white)),
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              textColor: Colors.white,
              color: Colors.blue[600],
              onPressed: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Text(ques,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ]),
            ),
          )),
    );
  }

  static getAnswerBox(TextEditingController mycont) {
    return Center(
      child: Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Colors.grey[400],
            blurRadius: 50.0,
          ),
        ]),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
            child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.white)),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          textColor: Colors.black,
          color: Colors.white,
          onPressed: () {},
          child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            controller: mycont,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your answer here...',
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        )),
      ),
    );
  }

  static getTargetBox(Color abc, String text, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: DragTarget(
        onAccept: (String label) {
          text = label;
          abc = Colors.black;
        },
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            width: 197.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: accepted.isEmpty ? abc : Colors.red[100],
            ),
            child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ),
          );
        },
      ),
    );
  }
}
