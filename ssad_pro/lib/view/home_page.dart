import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/assignment.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/assessment_history.dart';
import 'package:ssadpro/view/assignmentList.dart';
import 'package:ssadpro/view/login.dart';
import 'package:ssadpro/view/pointstest.dart';
import 'package:ssadpro/view/profile.dart';
import 'package:ssadpro/view/world_ui.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssadpro/view/user_list.dart';
import 'package:ssadpro/view/compete.dart';
import 'package:ssadpro/view/settings.dart';
import 'package:ssadpro/model/user.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.image});
  final String image;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //Assignment assignment = Provider.of<Assignment>(context);

//    var assignments = Provider.of<List<Assignment>>(context);

    // return StreamProvider<List<StudentUser>>.value(
    User user = Provider.of<User>(context);
    // value: DatabaseService().users,

    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Container(
          decoration: BoxDecoration(),
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


                Text(
                  'STUDENT',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                StreamBuilder<UserData>(
                    stream: DatabaseService(email: user.email).userData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        UserData userData = snapshot.data;
                        return Column(children: <Widget>[
//                        Text(
//                          userData.matric,
//                          style: TextStyle(
//                              fontSize: 12,
//                              color: Colors.grey[600],
//                              fontWeight: FontWeight.bold),
//                        ),
                          Text(
                            userData.name,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue[600],
                                fontWeight: FontWeight.bold),
                          )
                        ]);
                      } else {
                        return Text('Error retreiving Information');
                      }
                    }),

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
                              Icons.blur_on,
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
                          MaterialPageRoute(builder: (context) => Compete()),
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
                SizedBox(height: 20),
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
                        /*
                        Navigator.push(
                          context,
                          MaterialPageRoute(

                              builder: (context) => StudentAssignments()),
                        );

                         */
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
                SizedBox(height: 20),
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
                /*
                SizedBox(
                  child: RaisedButton(
                    child: Text('Profile'),
                    color: Colors.red,
                    onPressed: () {
                      navigateToSubPage(context);
                    },
                  ),
                )
                */

//          StreamProvider<List<Assignment>>.value(
//              value: DatabaseService().assignments,
                 SizedBox(
                     child: RaisedButton(
                   child: Text('Points'),
                   color: Colors.red,
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) =>
                               PointsTest()),

                       //
                     );

                   },
                 ))
//        )
              ])),
        ));
  }
}
