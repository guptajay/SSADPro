/**
 * This class return the page layout displaying
 * list of users.
 * 
 *
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/user_tile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<StudentUser>>(context) ?? [];

    return Row(children: <Widget>[
      Expanded(
          child: SizedBox(
              height: 200.0,
              child: new ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return UserTile(user: users[index]);
                },
              )))
    ]);
  }
}
