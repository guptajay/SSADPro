/**
 * This class return the page layout displaying
 * settings of the application.
 * 
 * @author Jay Gupta
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/view/profile.dart';
import 'package:ssadpro/view/system_settings.dart';
import 'package:ssadpro/view/background.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReusableWidgets.getAppBar(
            "Settings", Colors.white, Color(0xff1F3668)),
        body: Center(
            child: Container(
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage("assets/images/space.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.90), BlendMode.dstATop))),
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SingleChildScrollView(
                  child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                                height: 350,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/ssadpro_logo.png'))),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 270),
                                        child: Center(
                                          child: Text(
                                            "SSADPro v1.0",
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(height: 50),
                            CardView.getCard(
                                context, Profile(), "Profile", Icons.person),
                            SizedBox(
                              height: 20,
                            ),
                            CardView.getCard(context, SystemSettings(),
                                "Settings", Icons.settings)
                          ])
                    ]),
              ))),
        )));
  }
}
