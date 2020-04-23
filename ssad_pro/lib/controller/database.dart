import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ssadpro/model/assignment.dart';
import 'package:ssadpro/model/group.dart';
import 'package:ssadpro/model/student_user.dart';
import 'package:ssadpro/model/user.dart';
import 'package:ssadpro/view/user_list.dart';
import 'package:ssadpro/model/Student.dart';

class DatabaseService {
  static const String USER_COLLECTION = 'Users';
  static const String USER_DATA_COLLECTION = 'UserData';
  static const String USER_ASSIGNMENT_COLLECTION = 'UserAssignments';
  static const String USER_DATA_DOCUMENT = 'userDetails';
  static const String QUESTIONS_COLLECTION = 'Questions';
  static const String GROUPS_COLLECTION = 'Groups';
  static const String USER_CHALLENGE_COLLECTION = 'UserChallenges';

  final String email;

  DatabaseService({this.email});

  //collection reference
  final CollectionReference studentUserCollection =
      Firestore.instance.collection(USER_COLLECTION);

  //Function to create a new student document in the database
  Future updateStudentUserData(
      String name,
      String group,
      String email,
      String progress,
      List<int> points,
      List<String> dates,
      int total_attempts,
      int reg_state) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
          Firestore.instance.collection(USER_COLLECTION).document(this.email), {
        'name': name,
        'group': group,
        'email': email,
        'progress': progress,
        'points': points,
        'dates': dates,
        'total_attempts': total_attempts,
        'reg_state': reg_state,
      });
    });
  }

  //Function to create user assignment in user data base
  Future createUserAssignment(
      String name,
      String topic,
      String status,
      String course,
      List<String> questions,
      List<String> answers,
      String dueDate,
      String fileName) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
          Firestore.instance
              .collection(USER_COLLECTION)
              .document(this.email)
              .collection(USER_ASSIGNMENT_COLLECTION)
              .document(fileName),
          {
            'name': name,
            'topic': topic,
            'status': status,
            'questions': questions,
            'answers': answers,
            'course': course,
            'dueDate': dueDate,
          });
    });
  }

  Future createUserAssignmentExt(
      String name,
      String email,
      String topic,
      String status,
      String course,
      List<String> questions,
      List<String> answers,
      String dueDate,
      String fileName) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
          Firestore.instance
              .collection(USER_COLLECTION)
              .document(email)
              .collection(USER_ASSIGNMENT_COLLECTION)
              .document(fileName),
          {
            'name': name,
            'topic': topic,
            'status': status,
            'questions': questions,
            'answers': answers,
            'course': course,
            'dueDate': dueDate,
          });
    });
  }

  //Function to update user assignment in user data base
  Future updateUserAssignment(
      String name,
      String topic,
      String status,
      String course,
      List<String> questions,
      List<String> answers,
      String dueDate,
      String fileName) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance
              .collection(USER_COLLECTION)
              .document(this.email)
              .collection(USER_ASSIGNMENT_COLLECTION)
              .document(fileName),
          {
            'name': name,
            'topic': topic,
            'status': status,
            'questions': questions,
            'answers': answers,
            'course': course,
            'dueDate': dueDate,
          });
    });
  }

  //Function to send user assignment to OTHER user data base
  Future sendUserAssignment(
      String email,
      String name,
      String topic,
      String status,
      String course,
      List<String> questions,
      List<String> answers,
      String dueDate,
      String fileName) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance
              .collection(USER_COLLECTION)
              .document(email)
              .collection(USER_ASSIGNMENT_COLLECTION)
              .document(fileName),
          {
            'name': name,
            'topic': topic,
            'status': status,
            'questions': questions,
            'answers': answers,
            'course': course,
            'dueDate': dueDate,
          });
    });
  }

  //Function to send user assignment to OTHER user data base
  Future sendChallenge(
      String challengee_email,
      int challenger_points,
      ) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
          Firestore.instance
              .collection('Users')
              .document(challengee_email)
              .collection('UserChallenges')
              .document(),
          {
            'challenger_points': challenger_points,
            'challenger_email': this.email,

          });
    });
  }




  //Function to send user assignment to OTHER user data base
  Future updateChallenge(
      String challengee_email,
      int challenger_points,
      String fileName) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance
              .collection(USER_COLLECTION)
              .document(challengee_email)
              .collection(USER_CHALLENGE_COLLECTION)
              .document(fileName),
          {
            'challenger_points': challenger_points,
            'challenger_email': this.email,

          });
    });
  }




  //Function to create group documents in database
  Future createGroup(
    String course,
    String name,
    List<String> students,
  ) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
          Firestore.instance.collection(GROUPS_COLLECTION).document(name), {
        'course': course,
        'name': name,
        'students': students,
      });
    });
  }

//Function to update the documents of the collection 'Groups'
  Future updateGroup(
      String course,
    String name,
    List<String> students,
  ) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance.collection(GROUPS_COLLECTION).document(name), {
        'course': course,
        'name': name,
        'students': students,
      });
    });
  }

  //Function to create or update questions and answers in user data base
  //fileName - Difficulty of the question
  Future updateQuestions(
      List<String> questions, List<String> answers, String fileName) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance
              .collection(QUESTIONS_COLLECTION)
              .document(fileName),
          {
            'questions': questions,
            'answers': answers,
          });
    });
  }

  //user list from snapshot
  List<StudentUser> _studentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return StudentUser(
        email: doc.data['email'] ?? '',
        name: doc.data['name'] ?? '',
        group: doc.data['group'] ?? '',
        progress: doc.data['progress'] ?? '',
      );
    }).toList();
  }

// user data from snapshots
  //This function cannot retrieve list based information from the database
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      email: email,
      name: snapshot.data['name'],
      group: snapshot.data['group'],
      progress: snapshot.data['progress'],
      points: snapshot.data['points'],
      dates: snapshot.data['dates'],
      total_attempts: snapshot.data['total_attempts'],
    );
  }


  //Getter to get a list of registered users from database
  Stream<List<StudentUser>> get users {
    return studentUserCollection.snapshots().map(_studentListFromSnapshot);
  }

  //Getter to get the current user details from database
  Stream<UserData> get userData {
    return studentUserCollection
        .document(this.email)
        .snapshots()
        .map(_userDataFromSnapshot);
  }


//Function to update the group of the current user in the data base
  Future updateStudentGroup(String group) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance.collection(USER_COLLECTION).document(this.email),
          {'group': group});
    });
  }

//Function to update the progress of the CURRENT user in the database
  Future updateStudentProgress(String progress) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance.collection(USER_COLLECTION).document(this.email),
          {'progress': progress});
    });
  }

  //Function to update the group of ANY user in the database
  Future updateStudentGroupext(String group, String email) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance.collection(USER_COLLECTION).document(email),
          {'group': group});
    });
  }

  Future updateStudentPoints(List<dynamic> points) async {
    return await Firestore.instance.runTransaction((transaction) async {
      await transaction.update(
          Firestore.instance.collection(USER_COLLECTION).document(this.email),
          {'points': points});
    });
  }
//Function to return the assignments of a particular students
  //Use can be traced from 'assignment_list.dart'
  Stream<QuerySnapshot> getAssignmentSnapshots() {
    List<DocumentSnapshot> activeAssigments = new List();

    return Firestore.instance
        .collection('Users')
        .document(this.email)
        .collection('UserAssignments')
        .snapshots();
  }

  //Function to get all the groups in the Groups Collection
  Stream<QuerySnapshot> getGroupsSnapshots() {
    return Firestore.instance.collection('Groups').snapshots();
  }

//Function to get all the challenges in the UserChallenges Collection
  Stream<QuerySnapshot> getChallengesSnapshots() {

    return Firestore.instance
        .collection('Users')
        .document(this.email)
        .collection('UserChallenges')
        .snapshots();
  }


  Future<int> getRegState() async {

    QuerySnapshot qs = await studentUserCollection.getDocuments();
    for (DocumentSnapshot ds in qs.documents) {
        if(ds.data['email'] == this.email)
         return ds.data['reg_state'];
    }

  }



}
