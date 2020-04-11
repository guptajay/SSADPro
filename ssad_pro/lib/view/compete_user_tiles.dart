import 'package:flutter/material.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/card.dart';

class CompeteUserTile extends StatelessWidget {
  final StudentUser user;
  CompeteUserTile({this.user});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardView.getCard(context, StudentUser(), user.name, Icons.face),
      SizedBox(height: 20),
    ]);
  }
}
