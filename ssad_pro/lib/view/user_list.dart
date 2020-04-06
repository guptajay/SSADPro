import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/student_group.dart';
import 'package:ssadpro/view/user_tile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<StudentUser>>(context) ?? [];
    final List<StudentUser> selected_users = new List(users.length) ?? [];
//    users.forEach((user)
//        {
//          print(user.name);
//          print(user.matric);
//          print(user.age);
//          print(user.group);
//
//        });
//    return Container();
//
    return Row(
        children: <Widget>[
        Expanded(
        child: SizedBox(
        height: 200.0,
        child: new ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserTile(user: users[index]);
      },
        )
    )
    )
    ]
    );

  }
}


