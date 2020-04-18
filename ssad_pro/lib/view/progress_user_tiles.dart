/**
 * This class return the layout of the button used 
 * to show student for tracking their progress.
 * @author Divyesh Mundhra
 */

import 'package:flutter/material.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/card.dart';
import 'package:ssadpro/view/progress_page.dart';

class ProgressUserTile extends StatelessWidget {
  final StudentUser user;
  ProgressUserTile({this.user});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CardView.getCard(context, ProgressPage(userdata: user.progress),
          user.name, Icons.face),
      SizedBox(height: 20),
    ]);
  }
}
