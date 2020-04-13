import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/user_list.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/progress_student_list.dart';

class ProgressList extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<StudentUser>>.value(
        value: DatabaseService().users,
        child: Scaffold(
            appBar: ReusableWidgets.getAppBar(
                "Track Progress", Colors.blue[600], Colors.grey[50]),
            body: Scaffold(
                body: Container(
                    decoration: BoxDecoration(),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                            ),
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
                                            child: Text(
                                                "Choose one of the students to view their progress",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.blue[600]))))),
                              ],
                            )),
                            Expanded(child: ProgressStudentList())
                          ]),
                    ))
                //UserList() Prints all the registered users of the application
                )));
  }
}
