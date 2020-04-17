import 'package:flutter/material.dart';

class Background {
  static getBackground() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/space_background.png"),
        fit: BoxFit.cover,
      ),
    );
  }
}
