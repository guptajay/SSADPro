/**
 * This class return the page layout displaying
 * system setting of the application.
 * 
 *
 */

import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/background.dart';
import 'dart:async';

class SystemSettings extends StatefulWidget {
  @override
  _SystemSettingsState createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  /// Initialize platform state.
  Future<void> initPlatformState() async {
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    var actionItems = getListOfActionButtons();
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(
          "Settings", Colors.white, Color(0xff1F3668)),
      backgroundColor: Colors.transparent,
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("assets/images/space.jpg"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.75), BlendMode.dstATop))),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
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
                        Column(
                            children:
                                List.generate(actionItems.length, (index) {
                          return Center(
                              child: ButtonTheme(
                            child: actionItems[index],
                          ));
                        }))
                      ])
                ]))),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> getListOfActionButtons() {
    var actionItems = List<Widget>();

    actionItems.addAll([
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: InkWell(
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  textColor: Color(0xff1F3668),
                  color: Color(0xffFFB600),
                  onPressed: () {
                    AppSettings.openWIFISettings();
                  },
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.wifi,
                            color: Color(0xff1F3668),
                            size: 70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(children: <Widget>[
                            Text(
                              "WiFi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                  )))),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.05,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: InkWell(
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  textColor: Color(0xff1F3668),//Colors.white,
                  color: Color(0xffFFB600),
                  onPressed: () {
                    AppSettings.openAppSettings();
                  },
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.apps,
                            color: Color(0xff1F3668),
                            size: 70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(children: <Widget>[
                            Text(
                              "App Info",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                  )))),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.05,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: InkWell(
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  textColor: Color(0xff1F3668),
                  color: Color(0xffFFB600),
                  onPressed: () {
                    AppSettings.openSoundSettings();
                  },
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.surround_sound,
                            color: Color(0xff1F3668),
                            size: 70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(children: <Widget>[
                            Text(
                              "Sound",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                  )))),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.05,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: InkWell(
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  textColor: Color(0xff1F3668),
                  color: Color(0xffFFB600),
                  onPressed: () {
                    AppSettings.openDisplaySettings();
                  },
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.screen_lock_portrait,
                            color: Color(0xff1F3668),
                            size: 70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(children: <Widget>[
                            Text(
                              "Display",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                  )))),
    ]);

    return actionItems;
  }

  getSettingsCard(
    Object o,
    String title,
    IconData symbol,
  ) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: InkWell(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            textColor: Colors.white,
            color: Colors.blue[400],
            onPressed: o,
            child: Row(children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Icon(
                symbol,
                color: Colors.white,
                size: 70,
              ),
              SizedBox(
                width: 10,
              ),
              Column(children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ])
            ]),
          ),
        ));
  }
}
