import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_learning/provider/notifierProviders/noteApp_notifier_provider.dart';
import 'package:riverpod_learning/provider/notifierProviders/noteshome_screen.dart';

class AddNoteScreen extends ConsumerWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Add Note",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create New Note",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 12),

            TextField(
              controller: desController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // dummy action
                  ref
                      .read(noteProvider.notifier)
                      .addNote(
                        titleController.text.toString(),
                        desController.text.toString(),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotesListScreen()),
                  );
                  print("title: ${titleController.text}");
                  print("desc: ${desController.text}");
                },
                child: Text("Add Note"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
