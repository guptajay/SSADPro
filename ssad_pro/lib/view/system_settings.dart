import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/card.dart';
import 'dart:async';

class SystemSettings extends StatefulWidget {
  @override
  _SystemSettingsState createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
  @override
  void initState() {
    /// Call out to intialize platform state.
    initPlatformState();
    super.initState();
  }

  /// Initialize platform state.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    var actionItems = getListOfActionButtons();
    return Scaffold(
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
                          Column(
                              //mainAxisAlignment: MainAxisAlignment.center,

                              children:
                                  List.generate(actionItems.length, (index) {
                            return Center(
                                child: ButtonTheme(
                              child: actionItems[index],
                            ));
                          }))
                        ])
                  ])))),
    );
  }

  /// Dispose method to close out and cleanup objects.
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
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  textColor: Colors.white,
                  color: Colors.blue[400],
                  onPressed: () {
                    AppSettings.openWIFISettings();
                  },
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.wifi,
                            color: Colors.white,
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
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  textColor: Colors.white,
                  color: Colors.blue[400],
                  onPressed: () {
                    AppSettings.openAppSettings();
                  },
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.apps,
                            color: Colors.white,
                            size: 70,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(children: <Widget>[
                            Text(
                              "App Settings",
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
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  textColor: Colors.white,
                  color: Colors.blue[400],
                  onPressed: () {
                    AppSettings.openSoundSettings();
                  },
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.surround_sound,
                            color: Colors.white,
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
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  textColor: Colors.white,
                  color: Colors.blue[400],
                  onPressed: () {
                    AppSettings.openDisplaySettings();
                  },
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.screen_lock_portrait,
                            color: Colors.white,
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
