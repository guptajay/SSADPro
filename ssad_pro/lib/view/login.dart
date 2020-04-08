import 'package:flutter/material.dart';
import 'package:ssadpro/animation/animated_background.dart';
import 'package:ssadpro/controller/sign_in.dart';
import 'package:ssadpro/view/home_page.dart';
import 'package:ssadpro/view/instructor_dashboard.dart';
import 'package:simple_animations/simple_animations.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900)),
      Track("color2").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600))
    ]);
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SingleChildScrollView(
                child: ControlledAnimation(
                    playback: Playback.MIRROR,
                    tween: tween,
                    duration: tween.duration,
                    builder: (context, animation) {
                      return Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                animation["color1"],
                                animation["color2"]
                              ])),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new AnimatedBackground(),
                              Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/transparent_logo.png'))),
                                  child: Stack(
                                    children: <Widget>[],
                                  )),
                              Center(
                                  child: Container(
                                      width: 250,
                                      child: SwitchListTile(
                                        title: Text("I'm a Instructor",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                          });
                                        },
                                        activeTrackColor: Colors.orangeAccent,
                                        activeColor: Colors.deepOrange,
                                      ))),
                              SizedBox(
                                height: 15,
                              ),
                              _signInButton(),
                            ],
                          ));
                    }))));
  }

  Widget _signInButton() {
    return RaisedButton(
      splashColor: Colors.white,
      color: Colors.white,
      onPressed: () {
        _auth.signInWithGoogle().whenComplete(() {
          if (isSwitched) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return InstructorDashboard();
                },
              ),
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[600],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
