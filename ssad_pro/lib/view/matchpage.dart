import 'package:flutter/material.dart';
import 'package:ssad_start/dragObjects.dart';

class MatchPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<MatchPage> {
  final myController = TextEditingController();
  double width = 200.0, height = 60.0;
  Offset position;
  Color abc = Colors.grey[200];
  String text1 = "Answer 1";
  String text2 = "Answer 2";
  String text3 = "Answer 3";
  String text4 = "Answer 4";

  @override
  void initState() {
    super.initState();
    position = Offset(20.0, 440);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                centerTitle: true,
                title: Text("Match the Column ",
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
                              SizedBox(height: 20),
                              Expanded(
                                child: Table(
                                  border: TableBorder.all(
                                    color: Colors.blue,
                                  ),
                                  children: [
                                    TableRow(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text('Question 1',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text('Option 1',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text('Question 2',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text('Option 2',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text('Question 3',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text('Option 3',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text('Question 4',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 60,
                                            child: Text('Option 4',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue)),
                                          ),
                                        ),
                                      ),
                                    ])
                                  ],
                                ),
                              ),
                              Container(
                                  color: Colors.blue[900],
                                  height: 55,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Confirm Answer",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
//                          Stack(
//                            children: <Widget>[
//                              Container(
//                                  child: DragBox(Offset(0.0, 0.0), 'Box One', Colors.blueAccent)),
//                            ],
//                          )
                            ]),
                      ),
                    )))),
        DragBox(Offset(10.0, 440.0), 'Option 1', Colors.blueAccent),
        DragBox(Offset(220.0, 440.0), 'Option 2', Colors.blueAccent),
        DragBox(Offset(10.0, 520.0), 'Option 3', Colors.blueAccent),
        DragBox(Offset(220.0, 520.0), 'Option 4', Colors.blueAccent),
        Positioned(
          left: 209.0,
          top: 109,
          child: DragTarget(
            onAccept: (String label) {
              text1 = label;
              abc = Colors.black;
            },

            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                width: 197.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: accepted.isEmpty ? abc : Colors.red[100],
                ),
                child: Center(
                  child: Text(text1,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 209.0,
          top: 189,
          child: DragTarget(
            onAccept: (String label) {
              text2 = label;
              abc = Colors.black;
            },

            builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
                ) {
              return Container(
                width: 197.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: accepted.isEmpty ? abc : Colors.red[100],
                ),
                child: Center(
                  child: Text(text2,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 209.0,
          top: 269,
          child: DragTarget(
            onAccept: (String label) {
              text3 = label;
              abc = Colors.black;
            },

            builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
                ) {
              return Container(
                width: 197.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: accepted.isEmpty ? abc : Colors.red[100],
                ),
                child: Center(
                  child: Text(text3,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 209.0,
          top: 349,
          child: DragTarget(
            onAccept: (String label) {
              text4 = label;
              abc = Colors.black;
            },

            builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
                ) {
              return Container(
                width: 197.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: accepted.isEmpty ? abc : Colors.red[100],
                ),
                child: Center(
                  child: Text(text4,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
