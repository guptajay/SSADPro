import 'Student.dart';

class StudentGroup {
  String course;
  String groupName;
  List<String> members = [];

  StudentGroup({this.course, this.groupName});

  int getNumOfMembers(){
    return members.length;
  }

  removeMember(int indexToBeDeleted){
    members.removeAt(indexToBeDeleted);
  }
}
