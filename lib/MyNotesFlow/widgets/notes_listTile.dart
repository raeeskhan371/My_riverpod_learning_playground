import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/MyNotesFlow/helper/date_time_formate_function.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/model/note_model.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/providers/note_provider.dart';
import 'package:riverpod_learning/MyNotesFlow/notes/screens/update_note_screen.dart';

class Note_ListTile extends ConsumerStatefulWidget {
  Note_ListTile({super.key, required this.note});

  NoteModel note;

  @override
  ConsumerState<Note_ListTile> createState() => _Note_ListTileState();
}

class _Note_ListTileState extends ConsumerState<Note_ListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        leading: Container(
          width: 10,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text(
          widget.note.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              widget.note.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 6),
            Text(
              formateDateTime(widget.note.createdAt),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateNoteScreen(
                      title: widget.note.title,
                      description: widget.note.description,
                      id: widget.note.id,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                final id = widget.note.id;
                ref.read(noteProvider.notifier).deleteNote(id: id);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
