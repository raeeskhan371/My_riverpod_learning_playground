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
    final repository = _firestore.collection("users").doc(uid);
    final docRef = repository.collection("notes").doc();

    final note = NoteModel(
      title: title,
      description: description,
      id: docRef.id,
    );
    await docRef.set(note.toMap());
    print("NoteID: ${docRef.id}");
  }

  Future<void> userDeleteNote({required id}) async {
    final uid = _auth.currentUser!.uid;
    final repository = _firestore.collection("users").doc(uid);
    final docRef = repository.collection("notes").doc(id);
    docRef.delete();
  }

  Future<void> userUpdateNote({
    required String newTitle,
    required String newDes,
    required String id,
  }) async {
    final uid = _auth.currentUser!.uid;
    final repo = _firestore.collection("users").doc(uid);
    final docRef = repo.collection('notes').doc(id);
    await docRef.update({"title": newTitle, "description": newDes});
  }

  // Fetching Data
  // Stream<List<NoteModel>> fetchingNotes() {
  //   final uid = _auth.currentUser!.uid;

  //   return _firestore
  //       .collection("users")
  //       .doc(uid)
  //       .collection("notes")
  //       .snapshots()
  //       .map((snapshot) {
  //         return snapshot.docs.map((doc) {
  //           return NoteModel.fromMap(doc.data(), doc.id);
  //         }).toList();
  //       });
  // }
}
