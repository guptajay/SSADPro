import 'package:ssadpro/model/question.dart';
class Ass
{
  String email;
  Ass({this.email});
}

class Assignment{
  String email;
  String name;
  String topic;
  String status;


  Assignment({this.name, this.topic, this.status, this.email});

//  Assignment.fromJson(Map<String,dynamic> parsedJson)
//    : name = parsedJson['name'],
//      topic = parsedJson['topic'],
//        status = parsedJson['status'];



}