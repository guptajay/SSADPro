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
            color: Colors.grey[300],
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 60),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(question,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ]),
            ),
          )),
    );
  }
}

