import 'Level.dart';

class Section {
  int _sectionInt;
  List<Level> _levelList = [];
  String _sectionName;
  int _section_state;

  int get section_state => _section_state;

  set section_state(int value) {
    _section_state = value;
  } // Section(this._sectionInt, this._levelList, this._sectionName);
  Section();

  Map<String, dynamic> toJson() => {
        '_sectionInt': _sectionInt,
        '_levelList': _levelList,
        '_sectionName': _sectionName,
      };

  Section.fromJson(Map<String, dynamic> json)
      : _sectionInt = json['_sectionInt'],
        _sectionName = json['_sectionName'],
        _levelList = json['_levelList'];

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

  String get sectionName => _sectionName;

  set sectionName(String value) {
    _sectionName = value;
  }
}
