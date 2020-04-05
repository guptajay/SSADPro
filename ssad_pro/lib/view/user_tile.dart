//import 'package:provider/provider.dart';
//import 'package:ssadpro/model/student_user.dart';
//import 'package:flutter/material.dart';
//
//class UserList extends StatefulWidget {
//  @override
//  _UserListState createState() => _UserListState();
//}
//
//class _UserListState extends State<UserList> {
//  @override
//  Widget build(BuildContext context) {
//    final users = Provider.of<List<StudentUser>>(context);
//    for (int i = 0; i < users.length; i++) {
//      StudentUser user = users[i];
//      return Padding(
//        padding: const EdgeInsets.only(top: 8.0),
//        child: Card(
//          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
//          child: ListTile(
//            leading: CircleAvatar(
//              radius: 25.0,
//              backgroundColor: Colors.brown,
//            ),
//            title: Text(user.name),
//            subtitle: Text('Takes ${user.matric} sugar(s)'),
//          ),
//        ),
//
//      );
//    }
//  }
//}
//
//


import 'package:flutter/material.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/select_student_group.dart';
import 'package:ssadpro/view/user_list.dart';

class UserTile extends StatelessWidget {

  final StudentUser user;

  UserTile({ this.user });

  @override
  Widget build(BuildContext context) {
    Future navigateToSubPage(context) async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectStudentGroup()));
    }

    return Column(
        children: <Widget>[
      SizedBox(
      child: RaisedButton(
        child: Text(
            user.name
        ),
        color: Colors.red,
        onPressed: () {
          navigateToSubPage(context);
        },
      ),
    ),

    SizedBox(height: 20),
    ]
    );
  }
}
//}
//      Padding(
//      padding: const EdgeInsets.only(top: 8.0),
//      child: Card(
//        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
////        child: ListTile(
////          leading: CircleAvatar(
////            radius: 25.0,
////            backgroundColor: Colors.brown,
////          ),
//         // title:
//        child: Text(user.name),
//         // subtitle: Text('Takes ${brew.sugars} sugar(s)'),
//        ),
//      );
//
//  }
//}