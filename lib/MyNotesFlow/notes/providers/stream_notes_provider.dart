import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/model/note_model.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/notes_repositries/notes_repositries.dart';

final streamNotesProvider = StreamProvider<List<NoteModel>>((ref) {
  final repo = ref.watch(notesRepositriesProvider);
  return repo.fetchingNotes();
});
