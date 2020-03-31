import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ssadpro/model/student_user.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<StudentUser>>(context);
    users.forEach((StudentUser)
        {
          print(StudentUser.name);
          print(StudentUser.group);

        });

    return Container();
  }
}


