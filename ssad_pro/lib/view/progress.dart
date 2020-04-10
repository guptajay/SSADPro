import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Score, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Task, String>> _seriesPieData1;
  List<charts.Series<Task, String>> _seriesPieData2;
  double worlds = 3;
  double sections=7;
  double levels=2;

  _generateData() {
    var data1 = [
      new Score(1, '2 April', 30),
      new Score(1, '9 April', 40),
      new Score(1, '14 April', 80),
    ];
//    var data2 = [
//      new Score(2, 'Student1', 100),
//      new Score(2, 'Student2', 150),
//      new Score(2, 'Student3', 80),
//    ];
//    var data3 = [
//      new Score(3, 'Student1', 200),
//      new Score(3, 'Student2', 300),
//      new Score(3, 'Student3', 180),
//    ];

    var piedata = [
        new Task('Worlds Completed', worlds, Colors.blue[600]),
        new Task('Worlds Left', 5.0-worlds,Colors.blue[100]),
    ];

    var sectiondata = [
      new Task('Sections Completed', sections, Colors.blue[600]),
      new Task('Sections Left', 12.0-sections,Colors.blue[100]),
    ];

    var leveldata = [
      new Task('Levels Completed', levels, Colors.blue[600]),
      new Task('Levels Left', 9.0-levels,Colors.blue[100]),
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

//    _seriesData.add(
//      charts.Series(
//        domainFn: (Score Score, _) => Score.place,
//        measureFn: (Score Score, _) => Score.quantity,
//        id: '2',
//        data: data2,
//        fillPatternFn: (_, __) => charts.FillPatternType.solid,
//        fillColorFn: (Score Score, _) =>
//            charts.ColorUtil.fromDartColor(Color(0xff109618)),
//      ),
//    );
//
//    _seriesData.add(
//      charts.Series(
//        domainFn: (Score score, _) => score.place,
//        measureFn: (Score score, _) => score.quantity,
//        id: '3',
//        data: data3,
//        fillPatternFn: (_, __) => charts.FillPatternType.solid,
//        fillColorFn: (Score score, _) =>
//            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
//      ),
//    );

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
    // TODO: implement initState
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
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                //Tab(icon: Icon(FontAwesomeIcons.chartLine)),
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
                          'Student progress - Adventure Mode',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 2),
                          ),
                        ),
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
                          'World Progress',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 2.0,),
                        Expanded(
                          child: charts.PieChart(
                              _seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 3),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification: charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                        Text(
                          'Section Progress',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 2.0,),
                        Expanded(
                          child: charts.PieChart(
                              _seriesPieData1,
                              animate: true,
                              animationDuration: Duration(seconds: 3),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification: charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                        Text(
                          'Level Progress',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 2.0,),
                        Expanded(
                          child: charts.PieChart(
                              _seriesPieData2,
                              animate: true,
                              animationDuration: Duration(seconds: 3),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification: charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
//              Padding(
//                padding: EdgeInsets.all(8.0),
//                child: Container(
//                  child: Center(
//                    child: Column(
//                      children: <Widget>[
//                        Text(
//                          'Sales for the first 5 years',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
//                        Expanded(
//                          child: charts.LineChart(
//                              _seriesLineData,
//                              defaultRenderer: new charts.LineRendererConfig(
//                                  includeArea: true, stacked: true),
//                              animate: true,
//                              animationDuration: Duration(seconds: 5),
//                              behaviors: [
//                                new charts.ChartTitle('Years',
//                                    behaviorPosition: charts.BehaviorPosition.bottom,
//                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
//                                new charts.ChartTitle('Sales',
//                                    behaviorPosition: charts.BehaviorPosition.start,
//                                    titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
//                                new charts.ChartTitle('Departments',
//                                  behaviorPosition: charts.BehaviorPosition.end,
//                                  titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
//                                )
//                              ]
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
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
