import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/model/note_model.dart';

final notesRepositriesProvider = Provider<NotesRepositries>((ref) {
  return NotesRepositries(FirebaseFirestore.instance);
});

class NotesRepositries {
  FirebaseFirestore _firestore;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  NotesRepositries(this._firestore);

  Stream<List<NoteModel>> fetchingNotes() {
    final uid = _auth.currentUser!.uid;

    return _firestore
        .collection("users")
        .doc(uid)
        .collection("notes")
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return NoteModel.fromMap(doc.data(), doc.id);
          }).toList();
        });
  }
}
