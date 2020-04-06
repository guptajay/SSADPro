import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssadpro/model/assignment.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/user_list.dart';

class DatabaseService {

   String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference studentUserCollection = Firestore.instance.collection('users');
  //final CollectionReference assignmentSubCollection = Firestore.instance.collection('assignments');

  //Name of the collection - users
//Reference to the collection - studentUserCollection

  //Function to store user related data in the user collection for a particular user.
  Future updateStudentUserData(String name, String matric, int age, String group) async{
//    uid = uid + 'Details';
     return await studentUserCollection.document(uid).setData({
       'name': name,
       'matric': matric,
       'age' : age,
       'group': group,
       //'options': options,
//       'assignments' : assignments,
     });
   }


   Future updateAssignment(String name, String topic, String deadline, List<String> questions) async{

     return await studentUserCollection.document(uid).collection('assignments').document().setData({
       'name': name,
       'topic': topic,
       'deadline': deadline,
       'questions': questions,
     });

   }



   //user list from snapshot
  List<StudentUser> _studentListFromSnapshot(QuerySnapshot snapshot){
     return snapshot.documents.map((doc){
       return StudentUser(
         name: doc.data['name'] ?? '',
         matric: doc.data['matric'] ?? '',
         age: doc.data['age'] ?? 0,
         group: doc.data['group'] ?? '',

       );
     }).toList();
}


//userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
        name: snapshot.data['name'],
      matric: snapshot.data['matric'],
      age: snapshot.data['age'],
      group: snapshot.data['group'],
    );
  }

//get users collection stream
   Stream<List<StudentUser>> get users {
     return studentUserCollection.snapshots()
         .map(_studentListFromSnapshot);
   }

   //get docs stream
  //Mapping the firebase stream to the userdata model
  //Do not want to work with snapshots but with custom models
  Stream<UserData> get userData {
    return studentUserCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}