import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_learning/provider/notifierProviders/noteApp_notifier_provider.dart';

class UpdateNoteScreen extends ConsumerStatefulWidget {
  final String title;
  final String desc;
  final int index;
  UpdateNoteScreen({
    super.key,
    required this.title,
    required this.desc,
    required this.index,
  });

  @override
  ConsumerState<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends ConsumerState<UpdateNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController desController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.title);
    desController = TextEditingController(text: widget.desc);
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
            const Text(
              "Edit Your Note",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Title Field (dummy)
            TextField(
              controller: titleController,
              decoration: InputDecoration(border: OutlineInputBorder()),
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
                      .update(
                        index: widget.index,
                        newTitle: titleController.text,
                        newDesc: desController.text,
                      );
                  Navigator.pop(context);
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
