import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/model/note_model.dart';

class NotesFirebaseServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNote({
    required String title,
    required String description,
  }) async {
    final uid = _auth.currentUser!.uid;
    final note = NoteModel(title: title, description: description);
    final repository = await _firestore.collection("users").doc(uid);

    repository.collection("notes").add(note.toMap());
  }
}
