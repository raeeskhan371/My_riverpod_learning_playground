import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class NoteModel {
  final String title;
  final String description;
  final DateTime? createdAt;
  final String id;

  NoteModel({
    required this.title,
    required this.description,
    required this.id,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "createdAt": FieldValue.serverTimestamp(),
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map, String documentID) {
    return NoteModel(
      id: documentID,
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      createdAt: (map["createdAt"] as Timestamp?)?.toDate(),
    );
  }
}
