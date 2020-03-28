/**
 * This is the controller class which initialises the application.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:ssadpro/model/World.dart';
import 'package:ssadpro/view/WorldUI.dart';
import 'package:ssadpro/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssadpro/view/assessment_history.dart';
//import 'package:ssadpro/view/send_assignment.dart';




void main() => runApp(Startup());

class Startup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "SSADProO",
        theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: 'Open Sans',
                )),
//        home: DateTimePickerWidget());  // LoginPage FirstRoute
          home: MyHomePage());  // LoginPage FirstRoute

  }
}
