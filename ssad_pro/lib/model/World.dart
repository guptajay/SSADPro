import 'package:ssadpro/model/Section.dart';

class World {
  int _worldInt;
  List<Section> _sectionList = [];

  World();

  World.fromJson(Map<String, dynamic> json)
      : _worldInt = json['_worldInt'],
        _sectionList = json['_sectionList'];

  Map<String, dynamic> toJson() => {
        '_worldInt': _worldInt,
        '_sectionList': _sectionList,
      };
  Map<String, dynamic> toJso() => {
        '_worldInt': _worldInt,
      };

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
