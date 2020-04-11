import 'package:flutter/material.dart';


class QCheckList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Questions Select"),
          ),
          body: SafeArea(
              child : Center(

                child:CheckboxWidget(),

              )
          )
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State {

  Map<String, bool> values = {
    'Q1': false,
    'Q2': false,
    'Q3': false,
    'Q4': false,
    'O5': false,
    'O6': false,
    'O7': false,
    'O8': false,
    'O9': false,

  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[


      Expanded(
        child:
        ListView(
          children: values.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: values[key],
              activeColor: Colors.pink,
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  values[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
      RaisedButton(
        child: Text(" Add Questions ", style: TextStyle(fontSize: 18),),
        onPressed: getCheckboxItems,
        color: Colors.blueGrey,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
    ]);
  }
}