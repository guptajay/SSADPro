import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionUI extends StatefulWidget {
  @override
  _SectionUIState createState() => _SectionUIState();
}

class _SectionUIState extends State<SectionUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section Page'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Row(
            children: <Widget>[
              SectionBox('Section 1'),
              SectionBox('Section 2')
            ],
          ),
          Row(
            children: <Widget>[SectionBox('abc'), SectionBox('abc')],
          ),
          Row(
            children: <Widget>[SectionBox('abc'), SectionBox('abc')],
          ),
        ],
      ),
    );
  }
}

Container SectionBox(String Boxname) {
  return Container(
    margin: EdgeInsets.only(left: 80, top: 60),
    width: 100,
    height: 100,
    color: Colors.blue[300],
    child: FlatButton(
      child: Text('$Boxname'),
      onPressed: () {
        print('abc');
      },
    ),
  );
}
