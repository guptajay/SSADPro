import 'package:ssadpro/model/Section.dart';

class World {
  int _worldInt;
  List<Section> _sectionList = [];

  int get worldInt => _worldInt;

  set worldInt(int value) {
    _worldInt = value;
  }

  List<Section> get sectionList => _sectionList;

  set sectionList(List<Section> value) {
    _sectionList = value;
  }

  void addSection(Section section) {
    _sectionList.add(section);
  }
}
