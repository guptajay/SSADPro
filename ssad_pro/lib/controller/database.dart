import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/view/user_list.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference studentUserCollection = Firestore.instance.collection('users');
  //Name of the collection - users
//Reference to the collection - studentUserCollection

  //Function to store user related data in the user collection for a particular user.
  Future updateStudentUserData(String name, int group) async{

     return await studentUserCollection.document(uid).setData({
       'name': name,
       'group': group,
     });
   }

   //user list from snapshot

List<StudentUser> _studentListFromSnapshot(QuerySnapshot snapshot){
     return snapshot.documents.map((doc){
       return StudentUser(
         name: doc.data['name'] ?? '',
         group: doc.data['group'],
       );
     }).toList();
}

   Stream<List<StudentUser>> get users {
     return studentUserCollection.snapshots()
         .map(_studentListFromSnapshot);
   }
}