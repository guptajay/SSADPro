/**
 * This class implements the logic and home page for 
 * the compete mode of the application.
 *
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/services/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/compete_friend_list.dart';

class Compete extends StatelessWidget {
  Compete({Key key, this.isChallenged});
  final int isChallenged;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<StudentUser>>.value(
        value: DatabaseService().users,
        child: Scaffold(
            appBar: ReusableWidgets.getAppBar(
                "Compete Mode", Colors.white, Color(0xff1F3668)),
            body: Scaffold(
                body: Container(
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage("assets/images/space.jpg"),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.90), BlendMode.dstATop)
                        )
                    ),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                  'assets/images/google_logo.png',
                                )))),
                            Container(
                                child: Stack(
                              children: <Widget>[
                                Positioned(
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.70,
                                        margin: EdgeInsets.only(
                                            top: 15, bottom: 30),
                                        child: Center(
                                            child: const DecoratedBox(
                                                decoration: const BoxDecoration(
                                                    color: Color(0xff1F3668),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                              child: const Text(
                                                  "Choose one of your friends on Google to compete with!",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFFB600),//0xffE2950F
                                              )
                                              ),
                                            )
                                           /* Text(
                                                "Choose one of your friends on Google to compete with!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffE2950F),
                                                  backgroundColor: Paint().color = Color(0xff1F3668),
                                                ))*/
                            ))),
                              ],
                            )),
                            Expanded(child: CompeteFriendList())
                          ]),
                    ))
                )));
  }
}

void _showDialogBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Alert"),
        content: new Text(
            "You have been challenged by another friend! Please complete the challenge by clicking on the button below"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Complete Challenge"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
