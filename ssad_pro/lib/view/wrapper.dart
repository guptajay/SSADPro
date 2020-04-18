/**
 * This class contains the logic to
 * authenticate the users logging into
 * the application.
 * 
 * @author Jay Gupta
 */

import 'package:provider/provider.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/login.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return LoginPage();
  }
}
