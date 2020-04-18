//Creating a user object different from the firebase user object with only the info we need

class User {
  final String email;

  User({this.email});


}

class UserData {
  final String email;

  final String name;
//  final String matric;
//  final int age;
  final String group;
  final String progress;

  final List <dynamic> dates;
  final List <dynamic> points;
  final int total_attempts;
  final int reg_state;

  UserData({this.name, this.group, this.email, this.progress, this.total_attempts, this.dates, this.points, this.reg_state});


}