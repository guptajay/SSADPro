import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssadpro/view/progress_components.dart';

class ProgressPage extends StatefulWidget {
  final Widget child;

  ProgressPage({Key key, this.child}) : super(key: key);

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

  _generateData() {
    var data1 = [
      // for (var i=0 ; i<length ;i++){
      //   new Score(student id,date,score)
      // },
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
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
              ],
            ),
            title: Text('Progress Indicator'),
          ),
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
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            animationDuration: Duration(seconds: 2),
                          ),
                        ),
                        ProgressComponents.getBarChart(_seriesData)
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
