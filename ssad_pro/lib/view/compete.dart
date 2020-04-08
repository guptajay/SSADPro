import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/user_list.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/compete_friend_list.dart';

class Compete extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<StudentUser>>.value(
        value: DatabaseService().users,
        child: Scaffold(
          appBar: ReusableWidgets.getAppBar(
              "Compete Mode", Colors.blue[600], Colors.grey[50]),
          body: CompeteFriendList(),
          //UserList() Prints all the registered users of the application
        ));
  }
}
