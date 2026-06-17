import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/model/note_model.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/providers/note_provider.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/providers/stream_notes_provider.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/screens/add_note_screen.dart';
import 'package:riverpod_learning/MyNotesFlow/widgets/notes_listTile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final notesAsync = ref.watch(streamNotesProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: notesAsync.when(
        data: (notes) {
          if (notes.isEmpty) {
            return Center(child: Text("No Notes Found"));
          }
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];

              return Note_ListTile(note: note);
            },
          );
        },
        error: (error, Stack) {
          return Text("$error");
        },
        loading: () {
          return CircularProgressIndicator(color: Colors.blue);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
