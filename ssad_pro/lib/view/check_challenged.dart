/**
 * This class implements layout to display
 * the list of challenges received.
 *
 * @author Jay Gupta
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/challenged_list.dart';
import 'package:ssadpro/view/compete.dart';
import 'package:ssadpro/view/social_media.dart';
import 'package:ssadpro/controller/mcq_generator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckChallenged extends StatefulWidget {
  CheckChallengedState createState() => CheckChallengedState();
}

class CheckChallengedState extends State<CheckChallenged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Compete Mode", Colors.blue[600], Colors.grey[50]),
        backgroundColor: Colors.grey[50],
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                        0.5,
                        Icon(
                          FontAwesomeIcons.trophy,
                          color: Colors.blue[600],
                          size: 150,
                        ),
                      ),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: Container(
                                  child: Center(
                                      child: Text("You have been challenged by",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue[400])))))),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 250,
                        child: ChallengedList(),
                      ),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Column(children: <Widget>[])),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                      height: 50,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      onPressed: () {
                                        List<String> question =
                                            GenerateMCQ().question(99, 99, 0);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Compete(),
                                            ));
                                      },
                                      color: Colors.blue[600],
                                      child: Center(
                                          child: Text(
                                        "Challenge a new Friend!",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SocialMedia(
                                      text: "Invite your Friends via LinkedIn",
                                      image: "assets/images/linkedin_logo.png",
                                      shareText:
                                          "Hey there, I'm an student at SSADPro. Download the app now to start your learning journey on Software Engineering at https://github.com/guptajay/SSADPro"),
                                ],
                              )))
                    ]))))));
  }
}
