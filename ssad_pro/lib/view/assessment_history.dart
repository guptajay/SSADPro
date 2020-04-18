/**
 * This class implements logic to fetch the assessment history 
 * of each student and their scores as well.
 *
 * @author Ritwik Kanodia
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/assignmentList.dart';

class AssessmentHistory extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<StudentUser>>.value(
        value: DatabaseService().users,
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                  title: Text("Assessments",
                      style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.grey[50],
                  brightness: Brightness.light,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.blue[600],
                  ),
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(100.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: TabBar(
                          tabs: [
                            Tab(
                              icon: Icon(
                                Icons.check,
                                color: Colors.blue[600],
                                size: 40,
                              ),
                              child: Text("Present",
                                  style: TextStyle(
                                      color: Colors.blue[600], fontSize: 15)),
                            ),
                            Tab(
                              icon: Icon(
                                Icons.history,
                                color: Colors.blue[600],
                                size: 40,
                              ),
                              child: Text("History",
                                  style: TextStyle(
                                      color: Colors.blue[600], fontSize: 15)),
                            ),
                          ],
                        ),
                      ))),

              body: TabBarView(
                children: [
                  AssignmentList(status: "Active"),
                  AssignmentList(status: "Inactive")
                ],
              ),

            )));
  }
}
