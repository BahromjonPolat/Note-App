class Note {
  int? _id;
  String? _title;
  String? _body;
  int? _userId;

  Note(this._title, this._body, this._userId);

  Note.fromJson(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _body = map['body'];
    _userId = map['user_id'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['title'] = _title;
    map['body'] = _body;
    map['user_id'] = _userId;

    return map;
  }

  int get userId => _userId!;

  String get body => _body!;

  String get title => _title!;

  int get id => _id!;
}
