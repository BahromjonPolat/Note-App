
class Note {
  final int? _id;
  final String? _title;
  final String? _body;
  final int? _userId;

  Note(this._id, this._title, this._body, this._userId);

  int get id => _id!;

  String get title => _title!;

  int get userId => _userId!;

  String get body => _body!;
}