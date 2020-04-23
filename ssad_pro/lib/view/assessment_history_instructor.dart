/**
 * This class implements logic to fetch the assessment history
 * of each student and their scores as well.
 *
 *
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/services/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/student_user.dart';
import 'assignment_list_instructor.dart';

class AssessmentHistoryInstructor extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<StudentUser>>.value(
      value: DatabaseService().users,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Assessments",
              style: TextStyle(
                  color: Colors.brown[700],
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.amberAccent[100],
            brightness: Brightness.light,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.brown[700],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.brown[700],
                    height: 4.0,
                  ),
                  Container(
                    child: TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.check,
                            color: Colors.brown[700],
                            size: 40,
                          ),
                          child: Text("Present",
                              style:
                              TextStyle(color: Colors.brown[700], fontSize: 15)),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.history,
                            color: Colors.brown[700],
                            size: 40,
                          ),
                          child: Text("History",
                              style:
                              TextStyle(color: Colors.brown[700], fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            child: TabBarView(
              children: [
                AssignmentListInstructor(status: "Active"),
                AssignmentListInstructor(status: "Inactive")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
