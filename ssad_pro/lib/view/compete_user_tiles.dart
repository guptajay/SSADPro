import 'package:flutter/material.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/card.dart';
import 'package:ssadpro/view/compete_mcq.dart';
import 'package:ssadpro/controller/mcq_generator.dart';

class CompeteUserTile extends StatelessWidget {
  final StudentUser user;
  CompeteUserTile({this.user});
  @override
  Widget build(BuildContext context) {
    List<String> question = GenerateMCQ().question(99, 99);

    return Column(children: <Widget>[
      CardView.getCard(
          context,
          CompeteMCQPage(question[0], question[1], question[2], question[3],
              question[4], int.parse(question[5]), 99, 99, 1, 0),
          user.name,
          Icons.face),
      SizedBox(height: 20),
    ]);
  }
}
