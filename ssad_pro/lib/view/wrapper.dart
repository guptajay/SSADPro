import 'package:provider/provider.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/home_page.dart';
import 'package:ssadpro/view/login.dart';

import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    return LoginPage();

  }
}