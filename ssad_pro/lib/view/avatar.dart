/**
 * This class implements layout of page
 * which shows avatars to choose from.
 *
 * @author Jay Gupta
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/view/home_page.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/model/user.dart';

class Avatar extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: ReusableWidgets.getAppBar(
            "Choose Avatar", Colors.blue[600], Colors.grey[50]),
        body: Container(
          decoration: BoxDecoration(),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleImage(
                          image: "assets/images/boy.png", title: "Gentle"),
                      CircleImage(
                          image: "assets/images/boy-1.png", title: "Cool"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      CircleImage(
                          image: "assets/images/girl.png", title: "Obedient"),
                      CircleImage(
                          image: "assets/images/girl-1.png", title: "Genius"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      CircleImage(
                          image: "assets/images/man.png", title: "Swaggy"),
                      CircleImage(
                          image: "assets/images/man-1.png", title: "Boss"),
                    ],
                  )
                ]),
                SizedBox(height: 10),
                StreamBuilder<UserData>(
                    stream: DatabaseService(email: user.email).userData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        UserData userData = snapshot.data;
                        return Column(children: <Widget>[]);
                      } else {
                        return Text('Error retreiving Information');
                      }
                    }),
              ])),
        ));
  }
}

class CircleImage extends StatelessWidget {
  CircleImage({Key key, this.image, this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    double _size = MediaQuery.of(context).size.width * 0.35;
    return Center(
        widthFactor: 1.15,
        child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(image: image)),
              );
            },
            child: Column(children: <Widget>[
              Container(
                  width: _size,
                  height: _size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          )))),
              SizedBox(
                height: 10,
              ),
              Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ])));
  }
}
