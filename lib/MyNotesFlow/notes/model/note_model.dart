import 'package:flutter/foundation.dart';

class NoteModel {
  String title;
  String description;

  NoteModel({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {"title": title, "description": description};
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map["title"] ?? "",
      description: map["description"] ?? "",
    );
  }
}
