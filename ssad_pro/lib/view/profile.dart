import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/card.dart';
import 'package:ssadpro/view/appbar.dart';

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
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Profile", Colors.blue[600], Colors.grey[50]),
        backgroundColor: Colors.grey[50],
        body: Container(
            decoration: BoxDecoration(),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                  /*
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl,
                    ),
                    radius: 40,
                    backgroundColor: Colors.transparent,
                  ),
                  */
                  SizedBox(height: 10),
                  Text(
                    'STUDENT',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  StreamBuilder<UserData>(
                      stream: DatabaseService(email: user.email).userData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          UserData userData = snapshot.data;
                          return Column(children: <Widget>[
                            Text(
                              userData.name,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 40),
//                            CardView.getCardNoClick("Matriculation Number",
//                                userData.matric, Icons.credit_card),
                            SizedBox(
                              height: 20,
                            ),
//                            CardView.getCardNoClick("Age",
//                                userData.age.toString(), Icons.child_care),
                            SizedBox(
                              height: 20,
                            ),
                            CardView.getCardNoClick("Adventure Mode",
                                "Not yet Started", Icons.blur_on),
                            SizedBox(
                              height: 20,
                            ),
                            CardView.getCardNoClick("Compete Mode",
                                "Not yet Started", Icons.compare_arrows),
                            SizedBox(
                              height: 20,
                            ),
                          ]);
                        } else {
                          return Text('Error retreiving Information');
                        }
                      }),
                ]))));
  }
}
