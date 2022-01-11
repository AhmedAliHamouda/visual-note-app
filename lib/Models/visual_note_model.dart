import 'package:visual_notes/Utils/constants.dart';

class VisualNoteModel {
  int? id;
  String? title;
  String? picture;
  String? description;
  String? date;
  bool? status;

  VisualNoteModel({
    this.id,
    this.title,
    this.picture,
    this.description,
    this.date,
    this.status,
  });

  VisualNoteModel.fromMap(Map<String, dynamic> map) {
    id = map[Constants.id];
    title = map['title'];
    picture = map['picture'];
    description = map['description'];
    date = map['date'];
    status = map['status']! == 1 ? true : false;
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = <String, Object?>{
      'title': title,
      'picture': picture,
      'description': description,
      'date': date,
      'status': status == true ? 1 : 0,
      //columnDone: done == true ? 1 : 0
    };
    if (id != null) {
      map[Constants.id] = id;
    }
    return map;
  }
}
