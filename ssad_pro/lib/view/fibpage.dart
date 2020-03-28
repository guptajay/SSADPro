import 'package:flutter/material.dart';
import 'package:ssadpro/controller/txt_handle.dart';

class FIBPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<FIBPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: Text("Fill in the Blanks",
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
        body: Container(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SingleChildScrollView(
                  child: Container(
                    height: 600,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 100),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: SizedBox(
                                  width: 300.0,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.white)),
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    textColor: Colors.white,
                                    color: Colors.blue[700],
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 40.0, bottom: 40),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Question to be asked"),
                                          ]),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              decoration: new BoxDecoration(boxShadow: [
                                new BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 20.0,
                                ),
                              ]),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: SizedBox(
                                  width: 300.0,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.white)),
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                    onPressed: () {},
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, bottom: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: TextField(
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      controller: myController,
                                                      decoration: InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'Enter your answer here...',
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  )),
                            ),
                          ),
                          SizedBox(height: 100),
                          Container(
                            padding: EdgeInsets.only(left: 2, right: 2),
                            child: SizedBox(
                                width: 55.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.white)),
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  textColor: Colors.white,
                                  color: Colors.blue[900],
                                  onPressed: () {
                                    if (myController.text == "correct") {
                                      createRecord("Correct", "fib");
                                    } else {
                                      createRecord("Wrong", "fib");
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Confirm Answer",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                  ),
                                )),
                          ),
                          RaisedButton(
                            child: Text('Retrieve Data'),
                            onPressed: () async {
                              print(await getData("fib"));
                              print(
                                  "____________________________________________");
                            },
                          ),
                          RaisedButton(
                            child: Text('Delete Data'),
                            onPressed: () {
                              deleteData("fib");
                            },
                          )
                        ]),
                  ),
                ))));
  }
}
