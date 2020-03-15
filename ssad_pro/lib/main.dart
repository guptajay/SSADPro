/**
 * This is the controller class which initialises the application.
 *
 * @author XYZ
 */
import 'package:flutter/material.dart';
import 'package:ssadpro/model/World.dart';
import 'package:ssadpro/view/WorldUI.dart';
import 'package:ssadpro/view/login.dart';

void main() => runApp(Startup());

class Startup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true, title: "SSADPro", home: WorldUI());
  }
}
