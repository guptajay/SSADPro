/**
 * This is the controller class which initialises the application.
 *
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/wrapper.dart';
import 'package:ssadpro/services/database.dart';

void main() => runApp(Startup());

class Startup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final DatabaseService _db =
        DatabaseService(email: AuthService().getEmail());
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "SSADPro",
          theme: ThemeData(
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: 'Open Sans',
                  )),
          home: Wrapper()),
    );
  }
}
