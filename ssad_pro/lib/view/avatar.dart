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
import 'package:ssadpro/view/background.dart';

/**
 * Avatar Credits
 * Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
 * Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
 * Icons made by <a href="https://www.flaticon.com/authors/payungkead" title="Payungkead">Payungkead</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
 * Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
 * Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
 * Icons made by <a href="https://www.flaticon.com/authors/vectors-market" title="Vectors Market">Vectors Market</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
 */

class Avatar extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: ReusableWidgets.getAppBar(
            "Choose Avatar", Colors.white, Color(0xff1F3668)),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1.0008,
            decoration: BoxDecoration(color: Color(0xff1F3668)),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                  Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleImage(
                            image: "assets/images/ufo.png", title: "Alien"),
                        CircleImage(
                            image: "assets/images/alien.png", title: "Monster"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        CircleImage(
                            image: "assets/images/monster.png",
                            title: "One Eye"),
                        CircleImage(
                            image: "assets/images/astronaut.png",
                            title: "Astronaut"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        CircleImage(
                            image: "assets/images/satellite.png",
                            title: "Swag Satellite"),
                        CircleImage(
                            image: "assets/images/rocket.png",
                            title: "Super Rocket"),
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
          ),
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
                      color: Colors.grey[200],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            image,
                          )))),
              SizedBox(
                height: 10,
              ),
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ])));
  }
}
