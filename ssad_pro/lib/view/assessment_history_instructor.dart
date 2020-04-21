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
            title: Text(
              "Assessments",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color(0xff1F3668),
            brightness: Brightness.light,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 4.0,
                  ),
                  Container(
                    child: TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 40,
                          ),
                          child: Text("Present",
                              style:
                              TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 40,
                          ),
                          child: Text("History",
                              style:
                              TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("assets/images/space.jpg"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.75), BlendMode.dstATop),
              ),
            ),
            child: TabBarView(
              children: [
                AssignmentList(status: "Active"),
                AssignmentList(status: "Inactive")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
