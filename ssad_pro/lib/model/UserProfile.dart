class UserProfile{

  String _email;
  String _name;
  String _group;

  UserProfile({name, group}) {
    this._email = null;
    this._name = null;
    this._group = null;
  }

  String getEmail() => _email;

  setEmail(String value) {
    _email = value;
  }

  String getGroup() => _group;

  setGroup(String value) {
    _group = value;
  }

  String getName() => _name;

  setName(String value) {
    _name = value;
  }


}