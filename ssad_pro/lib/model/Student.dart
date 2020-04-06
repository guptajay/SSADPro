import 'StudentGroup.dart';

class Student {
  String userName; //For simplicity, _userName = email;
  String password;
  String _userNickname; //Name displayed in game
  List<bool> _unlockedWorldBool = [
    true
  ]; //first world unlocked = true, if the 2nd world is unlocked, [true, true]. 6 worlds in total
  List<String>
      _progressOfLevels; //All the levels completed of that section in that world
  List<String> _progressOfSections; //All the sections completed in that world

  //---------------------------------------------------------
  //Constructor
  Student({this.userName, this.password});

  //---------------------------------------------------------
  //Getters
  String get userNickname => _userNickname;

  List<bool> get unlockedWorldBool => _unlockedWorldBool;

  List<String> get progressOfLevels => _progressOfLevels;

  List<String> get progressOfSections => _progressOfSections;

  //---------------------------------------------------------
  //Setters
  set userNickname(String value) {
    _userNickname = value;
  }

  //---------------------------------------------------------
  //Method
  void updateUnlockedWorld() {
    _unlockedWorldBool.add(true);
  }

  List<String> updateProgressOfSection(String sectionCompleted) {
    _progressOfSections.add(sectionCompleted);
  }

  List<String> updateProgressOfLevels(String levelCompleted) {
    _progressOfLevels.add(levelCompleted);
  }
  
}
