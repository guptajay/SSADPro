import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/user.dart';

class SelectStudentGroup extends StatefulWidget {
  @override
  _SelectStudentGroupState createState() => _SelectStudentGroupState();
}

class _SelectStudentGroupState extends State<SelectStudentGroup> {

  final _formKey = GlobalKey<FormState>();
  final List<String> groups = ['1', '2', '3'];

  String _currentName;
  String _currentGroup;
  String _currentMatric;
  int _currentAge;

  // int _currentStrength;

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
                child: Scaffold(
                  body: Column(
                    children: <Widget>[
                      Text(
                        'Update your brew settings.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 20.0),

                      TextFormField(
                        initialValue: userData.group,
                        validator: (val) => val.isEmpty ? 'Please enter a group name' : null,
                        onChanged: (val) => setState(() => _currentGroup = val),
                      ),

                      RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              await DatabaseService(uid: user.uid).updateStudentUserData(
                                  userData.name,
                                  userData.matric,
                                userData.age,
                                  _currentGroup ?? snapshot.data.group,
                              );
                              Navigator.pop(context);
                            }
                          }
                      ),
//                      DropdownButtonFormField(
//                        value: _currentGroup ?? userData.group,
//                        //decoration: textInputDecoration,
//                        items: groups.map((group) {
//                          print(group);
//                          return DropdownMenuItem(
//                            value: group,
//                            child: Text('$group'),
//                          );
//                        }).toList(),
//                        onChanged: (val) => setState(() => _currentGroup = val),
//                      ),

//                      SizedBox(
//                      child: RaisedButton(
//                          color: Colors.pink[400],
//                          child: Text(
//                            'Update',
//                            style: TextStyle(color: Colors.white),
//                          ),
//                          onPressed: () async {
//                            if (_formKey.currentState.validate()) {
//                              await DatabaseService(uid: user.uid)
//                                  .updateStudentUserData(userData.name,
//                                userData.matric,
//                              userData.age,
//                                _currentGroup ?? snapshot.data.group,
//                              );
//                            }
//                          }
//                      ),
//                      ),

//                SizedBox(
//                    child: RaisedButton(
//                      child: Text(
//                          'InstructorDash'
//                      ),
//                      color: Colors.red,
//                      onPressed: () {
//                        Navigator.pop(context);
//                      },
//                    ),
//                )
                    ]
                )
                )
            );
          }
          else {
            return Text('No');
          }
        }
    );
  }
}
