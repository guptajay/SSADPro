import 'package:flutter/material.dart';
import 'package:ssadpro/view/fibpage.dart';
import 'package:ssadpro/view/mcqPage.dart';

class DatabaseDemo extends StatefulWidget {
  @override
  _DatabaseDemoScreen createState() => _DatabaseDemoScreen();
}

class _DatabaseDemoScreen extends State<DatabaseDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Database Connect'),
            ),
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  RaisedButton(
                    child: Text('MCQPage'),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>MCQPage("quest","1","2","3","4",4))
                      );
                    },
                  ),

                  RaisedButton(
                    child: Text('FibPage'),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>FIBPage())
                      );
                    },
                  ),
                  
                  // RaisedButton(
                  //   child: Text('History'),
                  //   onPressed: (){
                  //     setState(() async {
                  //       print(await getData());
                  //     });
                  //   },
                  // ),

                  // RaisedButton(
                  //   child: Text('Delete'),
                  //   onPressed: (){
                  //     setState(() {
                  //       deleteData();
                  //     });
                  //   },
                  // ),

    //               Text(
    //                 'What is course code of SSAD?'
    //               ),

    //               RaisedButton(
    //                   child: Text('3001'),
    //                   color: pressAttention ? Colors.grey : Colors.red,
    //                   onPressed: () {
    //                     setState(() {
    //                       pressAttention = !pressAttention;                          
    //                     });
    //                     createRecord("Wrong");
    //                   },
    //               ),

    //               RaisedButton(
    //                   child: Text('3003'),
    //                   color: pressAttention ? Colors.grey : Colors.green,
    //                   onPressed: () {
    //                     setState(() {
    //                       pressAttention = !pressAttention;                          
    //                     });
    //                     createRecord("Correct");
    //                   },
    //               ),
    //               RaisedButton(
    //                   child: Text('2001'),
    //                   color: pressAttention ? Colors.grey : Colors.red,
    //                   onPressed: () {
    //                     setState(() {
    //                       pressAttention = !pressAttention;                          
    //                     });
    //                     createRecord("Wrong");
    //                   },
    //               ),
    //               RaisedButton(
    //                   child: Text('2003'),
    //                   color: pressAttention ? Colors.grey : Colors.red,
    //                   onPressed: () {
    //                     setState(() {
    //                       pressAttention = !pressAttention;                          
    //                     });
    //                     createRecord("Wrong");
    //                   },
    //               ),
                ],
            )
        ),
    );
  }
}