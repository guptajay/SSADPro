import 'package:ssadpro/model/question.dart';

class Assignment{
  String name;
  String topic;
  String deadline;
  List<String> questions = new List(5);

  Assignment({this.name, this.topic, this.deadline, this.questions});


}