/**
 * This class implements the parameterised card button. 
 * This class shows the layout of questions diplayed.
 *
 *
 */
import 'package:flutter/material.dart';
import 'package:ssadpro/view/text_field.dart';

class QuestionLayout {
  static getCard(
    var _q,
    var _a,
    String quesTitle,
    String ansTitle,
  ) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, .5),
                  blurRadius: 20.0,
                  offset: Offset(0, 10))
            ]),
        child: Column(children: <Widget>[
          TextFields.getTextField(
              _q, TextInputType.text, TextInputAction.done, quesTitle),
          TextFields.getTextField(
              _a, TextInputType.text, TextInputAction.done, ansTitle),
        ]));
  }
}
