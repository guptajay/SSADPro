import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/services/database.dart';
import 'package:ssadpro/model/user.dart';

class AddCompeteScore extends StatelessWidget {
  AddCompeteScore({Key key, this.totalPoints});
  final int totalPoints;
  int flag = 0;
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return new StreamBuilder<UserData>(
      stream: DatabaseService(email: user.email).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (flag == 1)
            return Container();
          else {
            flag = 1;
            DatabaseService updateCompetePoints =
                new DatabaseService(email: user.email);
            UserData userData = snapshot.data;
            List<dynamic> points = userData.points;
            points.add(totalPoints);
            print(points);
            updateCompetePoints.updateStudentPoints(points);
            return Text(points[1].toString());
          }
        } else {
          return Text('No');
        }
      },
    );
  }
}
