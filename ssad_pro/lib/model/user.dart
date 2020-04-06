//Creating a user object different from the firebase user object with only the info we need

class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String matric;
  final int age;
  final String group;

  UserData({this.uid, this.name, this.matric, this.age, this.group});


}