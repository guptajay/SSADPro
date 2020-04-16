/**
 * This class return the components used in showing
 * progress of each student.
 *
 * @author Divyesh Mundhra
 */

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProgressComponents {
  static getPieChart(data1) {
    return charts.PieChart(data1,
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
            ]));
  }

  static getBarChart(data) {
    return charts.BarChart(
      data,
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      animationDuration: Duration(seconds: 2),
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Score {
  String date;
  int studentid;
  int quantity;

  Score(this.studentid, this.date, this.quantity);
}
