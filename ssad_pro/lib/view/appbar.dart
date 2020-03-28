/**
 * This class implements the parameterised AppBar throughout the application.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';

class ReusableWidgets {
  static getAppBar(
    String title,
    Color border,
    Color bgColor,
  ) {
    return AppBar(
        title: Text(title,
            style: TextStyle(
                color: border, fontSize: 35, fontWeight: FontWeight.bold)),
        backgroundColor: bgColor,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(
          color: border, //change your color here
        ),
        bottom: PreferredSize(
            child: Container(
              color: border,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)));
  }
}
