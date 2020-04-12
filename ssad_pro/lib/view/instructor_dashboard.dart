import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/assessment_history.dart';
import 'package:ssadpro/view/progress_page.dart';
import 'package:ssadpro/view/send_assessment.dart';
import 'package:ssadpro/view/login.dart';
import 'package:ssadpro/view/social_media.dart';
import 'package:ssadpro/view/student_group.dart';

class InstructorDashboard extends StatelessWidget {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(email: user.email).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Scaffold(
                backgroundColor: Colors.grey[50],
                body: Container(
                  decoration: BoxDecoration(),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/man-1.png"),
                          radius: 40,
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'INSTRUCTOR',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Text(
                          userData.name,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blue[600],
                              fontWeight: FontWeight.bold),
                        ),
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
                                  MaterialPageRoute(
                                      builder: (context) => StudentGroupPage()),
                                );
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.group,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Create Student Group",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))
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
                                  MaterialPageRoute(
                                      builder: (context) => SendAssessment()),
                                );
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.assessment,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Send Assignement",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))
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
                                  MaterialPageRoute(
                                      builder: (context) => ProgressPage()),
                                );
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.storage,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Track Progress",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AssessmentHistory()),
                                );
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.history,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Assessment History",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            )),
                        SizedBox(height: 20),
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
                          color: Colors.deepOrangeAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              'Sign Out',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SocialMedia(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Text('No');
          }
        });
  }
}
