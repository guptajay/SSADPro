import 'package:ssadpro/model/question.dart';

class Assignment{
  String name;
//  String topic;
//  String deadline;
  List<Question> questions = new List(5);

  Assignment({this.name, this.questions});

}