import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssadpro/view/progress_components.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/controller/score_list.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';

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
  final abc = ScoreList();
  int flag = 0;
  int len;

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Score, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesPieData1 = List<charts.Series<Task, String>>();
    _seriesPieData2 = List<charts.Series<Task, String>>();
    // _generateData(points);
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(email: user.email).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          List<dynamic> points = userData.points.toList();
          print(points);
          _generateData(points);
          len = points.length;

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
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child:
                                    ProgressComponents.getBarChart(_seriesData),
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
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'World Progress',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Expanded(
                                child: ProgressComponents.getPieChart(
                                    _seriesPieData),
                              ),
                              Text(
                                'Section Progress',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Expanded(
                                child: ProgressComponents.getPieChart(
                                    _seriesPieData1),
                              ),
                              Text(
                                'Level Progress',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Expanded(
                                child: ProgressComponents.getPieChart(
                                    _seriesPieData2),
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
        } else {
          return Text('Error Retreiving Points');
        }
      },
    );
  }

  _generateData(List<dynamic> points) {
    var data1 = [Score(1, 0, 30), Score(1, 1, 60)];
    // data1.add(Score(1, 2, points[1]));

    for (var i = 0; i < len; i++) {
      data1.add(Score(1, i + 1, points[i]));
    }
    //new Score(1, 0, 30);
    //  new Score(1, 1, 40),
    //  new Score(1, 2, 80),

    // for (var i=0;i<len;i++){
    //   data1.add(points[i]);
    // }

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
        domainFn: (Score score, _) => score.date.toString(),
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
}

class Score {
  int date;
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
