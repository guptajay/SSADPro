import 'package:flutter/material.dart';
import 'package:ssadpro/animation/fade_animation.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/view/questions_layout.dart';
import 'package:ssadpro/view/group_list.dart';

class Questions extends StatefulWidget {
  Questions({Key key, this.course, this.topic, this.dueDate});
  final String course;
  final String topic;
  final String dueDate;
  State createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  final formKey = GlobalKey<FormState>();
  var _q1 = TextEditingController();
  var _a1 = TextEditingController();
  var _q2 = TextEditingController();
  var _a2 = TextEditingController();
  var _q3 = TextEditingController();
  var _a3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Enter Questions", Colors.blue[600], Colors.grey[50]),
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
                        height: 20,
                      ),
                      FadeAnimation(
                        0.5,
                        Icon(
                          Icons.question_answer,
                          color: Colors.blue[600],
                          size: 120,
                        ),
                      ),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                              child: Container(
                                  child: Center(
                                      child: Text(
                                          "Enter the Questions & Answers",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.blue[400])))))),
                      FadeAnimation(
                          0.7,
                          Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  QuestionLayout.getCard(
                                      _q1, _a1, "Question 1", "Answer 1"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  QuestionLayout.getCard(
                                      _q2, _a2, "Question 2", "Answer 2"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  QuestionLayout.getCard(
                                      _q3, _a3, "Question 3", "Answer 3"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                      height: 50,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      onPressed: () {
                                        List<String> questions = [
                                          _q1.text,
                                          _q2.text,
                                          _q3.text
                                        ];
                                        List<String> answers = [
                                          _a1.text,
                                          _a2.text,
                                          _a3.text
                                        ];

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GroupList(
                                                  course: widget.course,
                                                  topic: widget.topic,
                                                  dueDate: widget.dueDate,
                                                  questions: questions,
                                                  answers: answers)),
                                        );
                                      },
                                      color: Colors.blue[600],
                                      child: Center(
                                          child: Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )))
                                ],
                              )))
                    ]))))));
  }
}

/*
import 'package:flutter/material.dart';
import 'package:ssadpro/view/appbar.dart';
//import 'dart:async';
//
//import 'package:flutter/rendering.dart';

class TextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Send Assessment", Colors.blue[600], Colors.grey[50]),
        body: Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.white,
            child: new Container(
              child: new Center(
                  child: new Column(children: [



                new Padding(padding: EdgeInsets.only(top: 40.0)), //top: 140.0)
                new Padding(padding: EdgeInsets.only(top: 50.0)),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Enter name of assignment",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "name of assignment cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 40.0)),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Topic",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Topic cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 40.0)),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Date in format dd-mm-yyyy",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Deadline Date cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
//                            new Container(),
//                            new select_date(),
                new Padding(padding: EdgeInsets.only(top: 40.0)),
                new RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
//                              // otherwise.
//                              if (_formKey.currentState.validate()) {
//                                // If the form is valid, display a Snackbar.
//                                Scaffold.of(context)
//                                    .showSnackBar(SnackBar(content: Text('Processing Data')));
//                              }
                  },
                  child: Text('Submit'),
                ),
              ])),
            )));
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and RaisedButton here.
        ]));
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// https://github.com/boriszv/Flutter-DatePicker-Example/blob/master/lib/main.dart

class select_date extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<select_date> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_dateTime == null
                ? 'Nothing has been picked yet'
                : _dateTime.toString()),
            RaisedButton(
              child: Text('Pick a date'),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2021))
                    .then((date) {
                  setState(() {
                    _dateTime = date;
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////
// https://github.com/flutter/flutter/issues/20065
//import 'dart:async';
//
//import 'package:flutter/material.dart';
//
////void main() => runApp( DatePickerTask());
//
//class DatePickerTask extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        floatingActionButton: Theme(
//          data: Theme.of(context).copyWith(
//            primaryColor: Colors.amber,
//          ),
//          child:  Builder(
//            builder: (c) => FloatingActionButton(
//                child:  Icon(Icons.date_range),
//                onPressed: () => _handleDatePicker(c)),
//          ),
//        ),
//        appBar: AppBar(title: Text('Date Picker Example')),
//        body: Center(
//            child: Builder(
//              builder: (con) => RaisedButton(
//                textColor: Theme.of(context).accentTextTheme.display1.color,
//                color: Theme.of(context).primaryColor,
//                child: Text('Choose a starting date'),
//                onPressed: () => showDatePicker(
//                  context: con,
//                  initialDate:  DateTime.now(),
//                  firstDate:
//                  DateTime.now().subtract( Duration(days: 30)),
//                  lastDate:  DateTime.now().add( Duration(days: 30)),
//                ),
//              ),
//            )),
//      ),
//    );
//  }
//
//  Future<Null> _handleDatePicker(BuildContext floatContext) async {
//
//    final DateTime picked = await showDatePicker(
//      context: floatContext,
//      initialDate: DateTime.now(),
//      firstDate: DateTime.now().subtract(Duration(days: 1)),
//      lastDate: DateTime.now().add( Duration(days: 1095)),
//    );
//
////    final dateResult = await showDatePicker(
////        context: floatContext,
////        firstDate: DateTime.now(),
////        initialDate: DateTime.now().subtract(Duration(days: 30)),
////        lastDate: DateTime.now().add(Duration(days: 60)));
////
////    //prints the chosen date from the picker
////    print(dateResult);
//
//  }
//}
//

/////////////////////////////////////////////////
// https://www.youtube.com/watch?v=8sFE8IQyv_c
class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016), // Earliest year
        lastDate: new DateTime(2019)); // Latest Year
    if (picked != null && picked != _date) {
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Date selected: ${_date.toString()}'),
             new RaisedButton(
              child: new Text('Select Date'),
//                onPressed: () => _handleDatePicker(c)),
//                onPressed: (){null;} //onPressed: (){_selectDate(context)}
//                onPressed: (){_handleDatePicker(context);} //onPressed: (){_selectDate(context)}
//                onPressed: (){_selectDate(context);}
    )
    
          ],
        ),
      ),
    );
  }

  Future<Null> _handleDatePicker(BuildContext floatContext) async {
    final dateResult = await showDatePicker(
        context: floatContext,
        firstDate: DateTime.now(),
        initialDate: DateTime.now().subtract(Duration(days: 30)),
        lastDate: DateTime.now().add(Duration(days: 60)));

    //prints the chosen date from the picker
    print(dateResult);
  }
}
*/
