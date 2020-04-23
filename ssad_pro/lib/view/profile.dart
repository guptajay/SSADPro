/**
 * This class implements the layout of the 
 * profile of the student.
 *
 *
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/services/database.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/card.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/model/progress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentMatric;
  int _currentAge;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Container(
      child: Scaffold(
          appBar: ReusableWidgets.getAppBar(
              "Profile", Colors.white, Color(0xff1F3668)),
          backgroundColor: Colors.grey,
          body: Container(
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage("assets/images/space.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.90), BlendMode.dstATop)
                  )
              ),//Background.getBackground(),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      'STUDENT',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    StreamBuilder<UserData>(
                        stream: DatabaseService(email: user.email).userData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            UserData userData = snapshot.data;
                            return Column(children: <Widget>[
                              Text(
                                userData.name,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xffFFAF02),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 40),
                              CardView.getCardNoClick(
                                  "Group", userData.group, Icons.group),
                              SizedBox(
                                height: 20,
                              ),
                              CardView.getCardNoClickSpecial(
                                  "Adventure Mode",
                                  FontAwesomeIcons.rocket,
                                  Progress.getWorld(userData.progress),
                                  Progress.getSection(userData.progress),
                                  Progress.getLevel(userData.progress)),
                              SizedBox(
                                height: 20,
                              ),
                            ]);
                          } else {
                            return Text('Error retreiving Information');
                          }
                        }),
                  ])))),
    );
  }
}
