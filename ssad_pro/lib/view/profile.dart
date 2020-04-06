import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/user.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentMatric;
  int _currentAge;


  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
                key: _formKey,
                child: Column(
                    children: <Widget>[
                      Text(
                          userData.name),
                      Text(
                          userData.matric),
                      Text(
                          userData.age.toString()),

                SizedBox(
                    child: RaisedButton(
                      child: Text(
                          'HomePage'
                      ),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);;
                      },
                    ),
          )
          ]
                    )
          );
          }
          else {
            return Text(
                'No'
            );
          }
        }
    );
  }
}

