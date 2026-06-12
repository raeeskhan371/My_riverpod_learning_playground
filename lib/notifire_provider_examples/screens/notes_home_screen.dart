import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_learning/notifire_provider_examples/screens/add_note_screen.dart';
import 'package:riverpod_learning/notifire_provider_examples/notifierProviders/noteApp_notifier_provider.dart';
import 'package:riverpod_learning/notifire_provider_examples/screens/update_note_screen.dart';

class NotesListScreen extends ConsumerWidget {
  NotesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Full NotesListScreen Ui Rebuild");
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "My Notes",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final notesList = ref.watch(noteProvider);
          // Note Lisview Rebuild
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              final note = notesList[index];

              return Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(
                          note.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(note.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateNoteScreen(
                                      title: note.title,
                                      desc: note.description,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit, color: Colors.blue),
                            ),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(noteProvider.notifier)
                                    .deleteNote(index: index);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
