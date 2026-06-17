import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/providers/note_provider.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/screens/home_screen.dart';

class UpdateNoteScreen extends ConsumerStatefulWidget {
  final String title;
  final String description;
  final String id;

  UpdateNoteScreen({
    super.key,
    required this.title,
    required this.description,
    required this.id,
  });

  @override
  ConsumerState<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends ConsumerState<UpdateNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController desController;

  void initState() {
    titleController = TextEditingController(text: widget.title.toString());
    desController = TextEditingController(text: widget.description.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Update Note",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit Your Note",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hint: Text("Title"),

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

            const SizedBox(height: 20),

            // Update Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(noteProvider.notifier)
                      .updateNote(
                        newTitle: titleController.text,
                        newDes: desController.text,
                        id: widget.id,
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text("Update Note"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
