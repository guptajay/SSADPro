import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';

import 'package:ssadpro/model/user.dart';

import 'package:ssadpro/view/assignment_tile.dart';

/*

class AssignmentList extends StatefulWidget {
  @override
  _AssignmentListState createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
//var assignments = DatabaseService().getStudentAssignments('A1');

// print (assignments);



 List<String> assignments = DatabaseService(email: user.email).getData();
 print('hi');
print(assignments);

//    assignments.forEach((assignment)
//    {
//      print(assignment);
//
//    });
//    return Container();

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

*/


class AssignmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    
    return new StreamBuilder<QuerySnapshot>(
        stream: DatabaseService(email: user.email).getAssignmentSnapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) return new Text('NO');
      return new Scaffold(
      body: ListView(
        children: snapshot.data.documents.map((DocumentSnapshot document) {
          if(document.data['status'] == 'Active')
          return new AssignmentTile(document: document);
//            title: new Text(document['name']),
//            subtitle: new Text(document['status']),

          else return Text('');
        }).toList(),
      )
      );
    },
    );


    }
  }


//child: new ListView.builder(
//itemCount: users.length,
//itemBuilder: (context, index) {
//return UserTile(user: users[index]);
//},

