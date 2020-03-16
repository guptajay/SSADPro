

class Instructor{
  String _userName; //For simplicity, _userName = email;
  String _password;
  String _userNickname; //Name displayed in game

  //---------------------------------------------------------
  //Constructor
  Instructor(this._userName, this._password); //Constructor for object creation

  //---------------------------------------------------------
  //Getters
  String get userNickname => _userNickname;

  String get userName => _userName;

  //---------------------------------------------------------
  //Setters
  set userNickname(String value) {
    _userNickname = value;
  }

}
