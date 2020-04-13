import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssadpro/view/progress_components.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/card.dart';
import 'package:ssadpro/view/appbar.dart';
import 'package:ssadpro/controller/progress.dart';

class ProgressPage extends StatefulWidget {
  final UserData userdata;
  final Widget child;

  ProgressPage({Key key, this.child, this.userdata}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ProgressPage> {
  List<charts.Series<Score, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Task, String>> _seriesPieData1;
  List<charts.Series<Task, String>> _seriesPieData2;
  double worlds = 3;
  double sections = 7;
  double levels = 2;

//   @override
//   Widget build(BuildContext context) {
//    User user = Provider.of<User>(context);
//    return   StreamBuilder<UserData>(
//                       stream: DatabaseService(email: user.email).userData,
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           UserData userData = snapshot.data;
//                           return ABC(userData)
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.blue[600],
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 40),
//                             CardView.getCardNoClick(
//                                 "Group", userData.group, Icons.group),
//                             SizedBox(
//                               height: 20,
//                             ),
// //                            CardView.getCardNoClick("Age",
// //                                userData.age.toString(), Icons.child_care),

//                             CardView.getCardNoClickSpecial(
//                                 "Adventure Mode",
//                                 Icons.blur_on,
//                                 Progress.getWorld(userData.progress),
//                                 Progress.getSection(userData.progress),
//                                 Progress.getLevel(userData.progress)),

//                             SizedBox(
//                               height: 20,
//                             ),
//                           ]);
//                         } else {
//                           return Text('Error retreiving Information');
//                         }
//                       });
//   }

  _generateData() {
    var data1 = [
      //  for (var i=0 ; i<length ;i++){
      //    new Score(student id,date,score)
      //  },
      new Score(1, '2 April', 30),
      new Score(1, '9 April', 40),
      new Score(1, '14 April', 80),
    ];

    var piedata = [
      new Task('Worlds Completed', worlds, Colors.blue[600]),
      new Task('Worlds Left', 5.0 - worlds, Colors.blue[100]),
    ];

    var sectiondata = [
      new Task('Sections Completed', sections, Colors.blue[600]),
      new Task('Sections Left', 12.0 - sections, Colors.blue[100]),
    ];

    var leveldata = [
      new Task('Levels Completed', levels, Colors.blue[600]),
      new Task('Levels Left', 9.0 - levels, Colors.blue[100]),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Score score, _) => score.date,
        measureFn: (Score score, _) => score.quantity,
        id: '1',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Score score, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue[100]),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'World Progress',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesPieData1.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Section Progress',
        data: sectiondata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesPieData2.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Level Progress',
        data: leveldata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Score, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesPieData1 = List<charts.Series<Task, String>>();
    _seriesPieData2 = List<charts.Series<Task, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text("Student Progress",
                  style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
              backgroundColor: Colors.grey[50],
              brightness: Brightness.light,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.blue[600],
                //change your color here
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(70.0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(
                            FontAwesomeIcons.solidChartBar,
                            color: Colors.blue[600],
                            size: 30,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            FontAwesomeIcons.chartPie,
                            color: Colors.blue[600],
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ))),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Student progress - Compete Mode',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ProgressComponents.getBarChart(_seriesData),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Student progress - Adventure Mode',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'World Progress',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Expanded(
                          child: ProgressComponents.getPieChart(_seriesPieData),
                        ),
                        Text(
                          'Section Progress',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Expanded(
                          child:
                              ProgressComponents.getPieChart(_seriesPieData1),
                        ),
                        Text(
                          'Level Progress',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Expanded(
                          child:
                              ProgressComponents.getPieChart(_seriesPieData2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Score {
  String date;
  int studentid;
  int quantity;

  Score(this.studentid, this.date, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
