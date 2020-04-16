import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/card.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/controller/progress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/space.jpg"),
        )
      ),
      child: Scaffold(
          appBar: ReusableWidgets.getAppBar(
              "Profile", Colors.blue[600], Colors.grey[50]),
          backgroundColor: Colors.transparent,
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/space.jpg"),
                )
              ),
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
                          color: Colors.white),
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
                                    color: Color(0xFFF7B32B),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 40),
                              CardView.getCardNoClick(
                                  "Group", userData.group, Icons.group),
                              SizedBox(
                                height: 20,
                              ),
//                            CardView.getCardNoClick("Age",
//                                userData.age.toString(), Icons.child_care),

                              CardView.getCardNoClickSpecial(
                                  "Adventure Mode",
                                  FontAwesomeIcons.rocket,
                                  Progress.getWorld(userData.progress),
                                  Progress.getSection(userData.progress),
                                  Progress.getLevel(userData.progress)),

                              SizedBox(
                                height: 20,
                              ),
                            ]);
                          } else {
                            return Text('Error retreiving Information');
                          }
                        }),
                  ])))),
    );
  }
}
