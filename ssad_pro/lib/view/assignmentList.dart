import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/assignment.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/student_group.dart';
import 'package:ssadpro/view/user_tile.dart';

import 'assignment_tile.dart';

class AssignmentList extends StatefulWidget {
  @override
  _AssignmentListState createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {
  @override
  Widget build(BuildContext context) {

//var assignments = DatabaseService().getStudentAssignments('A1');
// print (assignments);

//    var assignments = Provider.of<List<Assignment>>(context) ?? [];
//    print(assignments);
//   Future<List<DocumentSnapshot>> assignments = DatabaseService().getStudentAssignments();
//    print(assignments);
////
////    List <Assignment> active_assignments;
////
////    for(Assignment ass in assignments)
////      {
////        if(ass.status == 'Active')
////          active_assignments.add(ass);
////      }
//
//          awiaZZZZZt print(assignments.);



  return Container();
////
//    return Row(
//        children: <Widget>[
//          Expanded(
//              child: SizedBox(
//                  height: 200.0,
//                  child: new ListView.builder(
//                    itemCount: assignments.length,
//                    itemBuilder: (context, index) {
//                      return AssignmentTile(assignment: assignments[index]);
//                    },
//                  )
//              )
//          )
//        ]
//    );

  }
}


