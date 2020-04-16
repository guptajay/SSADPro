/**
 * This class implements the layout of the home page for
 * students to select different functionalities of the app.
 *
 * @author Jay Gupta
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/view/assessment_history.dart';
import 'package:ssadpro/view/check_challenged.dart';
import 'package:ssadpro/view/login.dart';
import 'package:ssadpro/view/world_ui.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/view/settings.dart';
import 'package:ssadpro/model/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.image});
  final String image;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/space.jpg"),
          )),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 40,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 20,
                ),
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
                                color: Color(0xFFF7B32B),
                                fontWeight: FontWeight.bold),
                          )
                        ]);
                      } else {
                        return Text('Error retreiving Information');
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      textColor: Colors.white,
                      color: Colors.blue[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorldUI(0, 0)),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.rocket,
                              color: Colors.white,
                              size: 70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Adventure",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold))
                          ]),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      textColor: Colors.white,
                      color: Colors.blue[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckChallenged()),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.compare_arrows,
                              color: Colors.white,
                              size: 70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Compete",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold))
                          ]),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      textColor: Colors.white,
                      color: Colors.blue[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AssessmentHistory()),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.assignment,
                              color: Colors.white,
                              size: 60,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Assessments",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold))
                          ]),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      textColor: Colors.white,
                      color: Colors.blue[700],
                      onPressed: () {
                        print('StudentAssignments');
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.show_chart,
                              color: Colors.white,
                              size: 70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Leaderboard",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold))
                          ]),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      textColor: Colors.white,
                      color: Colors.blue[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 60,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Settings",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold))
                          ]),
                    )),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    _auth.signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }), ModalRoute.withName('/'));
                  },
                  color: Colors.blue[400],
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
                SizedBox(
                  height: 20,
                ),
                SocialMedia(
                    text: "Invite your Friends via LinkedIn",
                    image: "assets/images/linkedin_logo.png",
                    shareText:
                        "Hey there, I'm an student at SSADPro. Download the app now to start your learning journey on Software Engineering at https://github.com/guptajay/SSADPro"),
              ])),
        ));
  }
}
