import 'package:ssadpro/view/mcqpage.dart';
import 'package:flutter/material.dart';
import 'package:ssadpro/view/fibpage.dart';
import 'package:ssadpro/view/match_page.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:ssadpro/view/profile.dart';
import 'package:ssadpro/view/system_settings.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ReusableWidgets.getAppBar(
            "Settings", Colors.blue[600], Colors.grey[50]),
        body: Center(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SingleChildScrollView(
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
                                                child: Text("SSADPro v1.0",
                                                    style: TextStyle(
                                                        fontSize: 40,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .blue[600]))))),
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
                    ])))));
  }
}
