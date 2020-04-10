/**
 * This class implements the UI of the text fields. 
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';

class TextFields {
  static getTextField(var _controller, TextInputType keyboard,
      TextInputAction action, String hintText) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]))),
      child: TextField(
        controller: _controller,
        style: TextStyle(color: Colors.black),
        keyboardType: keyboard,
        textInputAction: action,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
