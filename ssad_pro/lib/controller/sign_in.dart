import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:ssadpro/controller/database.dart';
import 'package:ssadpro/model/assignment.dart';
import 'package:ssadpro/model/question.dart';
import 'package:ssadpro/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String fullname;
  String name;
  String email;
  String imageUrl;
  int group = 1;

  //create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(email: user.email) : null;
  }

  //create user object based on FirebaseUser
//  String _userAssignmentFromFirebaseUser(FirebaseUser user) {
//    return userEmail != null ? email: null;
//  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
//  if(group<6) group++;
//  else group=1;

    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    //Comment this part to avoid resetting the database when the user logs in
    List<int> points = [0];
    List<String> dates = ['10/04/20'];
    int total_attempts = points.length - 1;

    List<String> questions = ['q1', 'q2', 'q3'];
    List<String> answers = ['a1', 'a2', 'a3'];

    List<String> students = ['Ritwik', 'Jay', 'Chean'];


    DatabaseService(email: user.email).updateStudentUserData(
        user.displayName,
        '0',
        user.email,
        'W1 S1 L1',
        points,
        dates,
        total_attempts,
        'userDetails');

    DatabaseService(email: user.email).updateUserAssignment(
        'A1', 'T1', 'Active', 'C1', questions, answers, 'Due Date', 'A1');
    DatabaseService(email: user.email).updateUserAssignment(
        'A2', 'T2', 'Active', 'C2', questions, answers, 'Due Date', 'A2');
    DatabaseService(email: user.email).updateUserAssignment(
        'A3', 'T3', 'Inactive', 'C3', questions, answers, 'Due Date', 'A3');

    DatabaseService().updateQuestions(questions, answers, 'easy');
    DatabaseService().updateQuestions(questions, answers, 'difficult');

    DatabaseService().createGroup('SS1', students);
    DatabaseService().createGroup('SS2', students);
    DatabaseService().createGroup('SS3', students);
    DatabaseService().createGroup('SS4', students);
    DatabaseService().createGroup('SS5', students);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoUrl;
    fullname = name;
    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded');

    // return 'signInWithGoogle succeeded: $user';
  }

  String getEmail() {
    return email;
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}
