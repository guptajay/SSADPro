import 'Level.dart';

class Section {
  int _sectionInt;
  List<Level> _levelList = [];

  int get sectionInt => _sectionInt;

  set sectionInt(int value) {
    _sectionInt = value;
  }

  List<Level> get levelList => _levelList;

  set levelList(List<Level> value) {
    _levelList = value;
  }

  void addLevel(Level level) {
    _levelList.add(level);
  }
}
