import 'package:flutter/foundation.dart';

class NoteModel {
  final String title;
  final String description;
  final String id;

  NoteModel({required this.title, required this.description, required this.id});

  Map<String, dynamic> toMap() {
    return {"title": title, "description": description};
  }

  factory NoteModel.fromMap(Map<String, dynamic> map, String documentID) {
    return NoteModel(
      id: documentID,
      title: map["title"] ?? "",
      description: map["description"] ?? "",
    );
  }
}
