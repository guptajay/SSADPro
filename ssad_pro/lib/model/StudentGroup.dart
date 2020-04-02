import 'Student.dart';

class StudentGroup {
  String groupId;
  String groupName;
  List<String> members = [];

  StudentGroup({this.groupId, this.groupName, this.members});

  int getNumOfMembers(){
    return members.length;
  }

  removeMember(int indexToBeDeleted){
    members.removeAt(indexToBeDeleted);
  }
}
