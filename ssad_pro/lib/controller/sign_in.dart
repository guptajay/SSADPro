import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    return user != null ? User(uid: user.uid) : null;
  }


  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
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

    List <String> options = ['o1', 'o2', 'o3', 'o4'];
//    List<Question> questions = new List();
//    List<Assignment> assignments = new List();
//    questions.add(Question(question: 'Demo 1', options: options, answer: 'o1')) ;
//    assignments.add(Assignment(name: 'A1', questions: questions));
    DatabaseService(uid: user.uid).updateStudentUserData(user.displayName, 'U20', 50, '0', options);

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
    return _userFromFirebaseUser(user);

    // return 'signInWithGoogle succeeded: $user';
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

