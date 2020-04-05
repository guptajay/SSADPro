/**
 * This is the controller class which initialises the application.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssadpro/view/assessment_history.dart';
import 'package:ssadpro/view/send_assessment.dart';
import 'package:ssadpro/view/track_progress.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/wrapper.dart';
void main() => runApp(Startup());

class Startup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "SSADPro",
          theme: ThemeData(
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: 'Open Sans',
                  )),
//        home: DateTimePickerWidget());  // LoginPage FirstRoute
          home: Wrapper()),
    ); // LoginPage FirstRoute
  }
}
