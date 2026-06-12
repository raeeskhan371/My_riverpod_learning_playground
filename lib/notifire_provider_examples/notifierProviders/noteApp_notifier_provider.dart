import 'package:riverpod/riverpod.dart';
import 'package:riverpod_learning/notifire_provider_examples/model/noteApp_Notifier_Model.dart';

final noteProvider = NotifierProvider<NoteAppNotifier, List<NoteApp>>(
  NoteAppNotifier.new,
);

class NoteAppNotifier extends Notifier<List<NoteApp>> {
  @override
  List<NoteApp> build() {
    return [];
  }

  // Add Note Function
  void addNote(String title, String description) {
    final newNote = NoteApp(title: title, description: description);
    state = [...state, newNote];
  }

  // Delete Fucntion

  void deleteNote({required int index}) {
    state = [...state..removeAt(index)];
  }

  // Uptedat Note Fucntion
  void update({
    required int index,
    required String newTitle,
    required String newDesc,
  }) {
    final updateList = [...state];

    updateList[index] = NoteApp(title: newTitle, description: newDesc);

    state = updateList;
  }
}
