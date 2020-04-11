/**
 * This class implements the parameterised card button. 
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';

class CardView {
  static getCard(
    BuildContext context,
    Object o,
    String title,
    IconData symbol,
  ) {
    return SizedBox(
        width: 300.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white)),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          textColor: Colors.white,
          color: Colors.blue[700],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => o),
            );
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  symbol,
                  color: Colors.white,
                  size: 70,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ]),
        ));
  }

  static getCardNoClick(
    String heading,
    String title,
    IconData symbol,
  ) {
    return SizedBox(
        width: 300.0,
        child: InkWell(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            textColor: Colors.white,
            color: Colors.blue[400],
            onPressed: () {},
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
                  heading,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ])
            ]),
          ),
        ));
  }

  static getCardNoClickSpecial(
    String heading,
    IconData symbol,
    String world,
    String section,
    String level,
  ) {
    return SizedBox(
        width: 300.0,
        child: InkWell(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            textColor: Colors.white,
            color: Colors.blue[400],
            onPressed: () {},
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  heading,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: <Widget>[
                  Icon(
                    Icons.bubble_chart,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "World - ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    world,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ]),
                Row(children: <Widget>[
                  Icon(
                    Icons.graphic_eq,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Section - ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    section,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ]),
                Row(children: <Widget>[
                  Icon(
                    Icons.layers,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Level - ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    level,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
              ])
            ]),
          ),
        ));
  }
}
