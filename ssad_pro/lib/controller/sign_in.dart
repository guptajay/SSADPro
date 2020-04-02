import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ssadpro/controller/database.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;


final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
int group=1;



Future<String> signInWithGoogle() async {

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );


  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;
  if(group<6) group++;
  else group=1;
  await DatabaseService(uid: user.uid).updateStudentUserData(name, group);

  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
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


