class Level {
  int _levelInt;

  Map<String, dynamic> toJson() => {
        '_levelInt': _levelInt,
      };

  Level.fromJson(Map<String, dynamic> json) : _levelInt = json['_levelInt'];
}
