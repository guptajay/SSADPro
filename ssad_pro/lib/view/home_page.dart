import 'package:flutter/material.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/view/login.dart';
import 'package:ssadpro/view/world_ui.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
              /*  backgroundImage: NetworkImage(
                  imageUrl,
                ),
                */

                radius: 40,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 10),

              Text(
                'STUDENT',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),

               /*
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold),
              ),

                */
              SizedBox(height: 20),
              SizedBox(
                  width: 300.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WorldUI()),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.blur_on,
                            color: Colors.white,
                            size: 70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Adventure",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ]),
                  )),
              SizedBox(height: 20),
              SizedBox(
                  width: 300.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WorldUI()),
                      );
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.compare_arrows,
                            color: Colors.white,
                            size: 70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Compete",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ]),
                  )),
              SizedBox(height: 20),
              SizedBox(
                  width: 300.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    onPressed: () {
                      /* 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DietTrackerDashboard()),
                      );
                      */
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.assignment,
                            color: Colors.white,
                            size: 60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Assessments",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ]),
                  )),
              SizedBox(height: 20),
              SizedBox(
                  width: 300.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    onPressed: () {
                      /* 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DietTrackerDashboard()),
                      );
                      */
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.show_chart,
                            color: Colors.white,
                            size: 70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Leaderboard",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ]),
                  )),
              SizedBox(height: 20),
              SizedBox(
                  width: 300.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    onPressed: () {
                      /* 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DietTrackerDashboard()),
                      );
                      */
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Settings",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ]),
                  )),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.blue[400],
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
