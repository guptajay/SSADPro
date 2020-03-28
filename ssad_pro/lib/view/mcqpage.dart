import 'package:ssad_start/constants.dart';
import 'package:ssad_start/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:ssad_start/bottom_button.dart';
import 'package:ssad_start/database_test.dart';

class MCQPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<MCQPage> {


  int pressAttention1 = 0;
  int pressAttention2 = 0;
  int pressAttention3 = 0;
  int pressAttention4 = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("MCQ Page",
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.grey[50],
            brightness: Brightness.light,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.grey[50], //change your color here
            ),
            bottom: PreferredSize(
                child: Container(
                  color: Colors.blue[600],
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(4.0))),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 300,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: SizedBox(

                          width: 300.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.white)),
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            textColor: Colors.white,
                            color: Colors.blue[700],
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top:60.0, bottom:60),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Question to be asked",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 40),
                    child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: pressAttention1==1?Colors.red[800]:(pressAttention1==2?Colors.grey:Colors.blue[700]),
                          onPressed: () {
                            setState(() => pressAttention1 = 1);
                            setState(() => pressAttention2 = 2);
                            setState(() => pressAttention3 = 2);
                            setState(() => pressAttention4 = 2);
                            createRecord("Wrong");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:40.0, bottom:40),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Option 1",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only( right: 40),
                    child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: pressAttention2==1?Colors.red[800]:(pressAttention2==2?Colors.grey:Colors.blue[700]),
                          onPressed: () {
                            setState(() => pressAttention2 = 1);
                            setState(() => pressAttention1 = 2);
                            setState(() => pressAttention3 = 2);
                            setState(() => pressAttention4 = 2);
                            createRecord("Wrong");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:40.0, bottom:40),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Option 2",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                        )),
                  ),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 40),
                    child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: pressAttention3==1?Colors.red[800]:(pressAttention3==2?Colors.grey:Colors.blue[700]),
                          onPressed: () {
                            setState(() { pressAttention3 = 1;pressAttention1 = 2;pressAttention2 = 2;pressAttention4 = 2;});
                            createRecord("Wrong");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:40.0, bottom:40),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Option 3",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only( right: 40),
                    child: SizedBox(
                        width: 300.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          textColor: Colors.white,
                          color: pressAttention4==1?Colors.green[800]:(pressAttention4==2?Colors.grey:Colors.blue[700]),
                          onPressed: () {
                            setState(() => pressAttention4 = 1);
                            setState(() => pressAttention1 = 2);
                            setState(() => pressAttention3 = 2);
                            setState(() => pressAttention2 = 2);
                            createRecord("Right");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:40.0, bottom:40),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Option 4",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                        )),
                  ),
                ),
              ],
            )),
            
          ],
        ));

  }
}
