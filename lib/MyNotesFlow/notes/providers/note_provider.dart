import 'package:riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/model/note_model.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/notes_repositries/notes_repositries.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/providers/note_state.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/services/notes_firebase_services.dart';

final noteProvider = StateNotifierProvider<NoteProvider, NoteState>((ref) {
  return NoteProvider();
});

class NoteProvider extends StateNotifier<NoteState> {
  NotesFirebaseServices _notesFirebaseServices = NotesFirebaseServices();

  NoteProvider() : super(NoteState(error: "", isLoading: false));

  Future<void> addNote({
    required String title,
    required String description,
  }) async {
    state = NoteState(error: "", isLoading: true);

    try {
      await _notesFirebaseServices.addNote(
        title: title,
        description: description,
      );
      state = NoteState(error: "", isLoading: false);
    } catch (e) {
      state = NoteState(error: e.toString(), isLoading: false);
      print(e);
    }
  }

  Future<void> deleteNote({required String id}) async {
    await _notesFirebaseServices.userDeleteNote(id: id);
  }

  Future<void> updateNote({
    required String newTitle,
    required String newDes,
    required String id,
  }) async {
    await _notesFirebaseServices.userUpdateNote(
      newTitle: newTitle,
      newDes: newDes,
      id: id,
    );
  }
}
