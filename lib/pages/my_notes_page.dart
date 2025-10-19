import 'package:flutter/material.dart';

class MyNotesPage extends StatefulWidget {
  final String title;
  const MyNotesPage({required this.title, super.key});
  State<MyNotesPage> createState() {
    return _MyNotesPageState();
  }
}

class _MyNotesPageState extends State<MyNotesPage> {
  final List<String> notes = [];
  final TextEditingController noteController = TextEditingController();
  void addNote(){
    if (noteController.text.isNotEmpty) {
      setState(() {
        notes.add(noteController.text);
        noteController.clear();
      });
    }
  }
  void deleteNote(int index){
    setState(() {
      notes.removeAt(index);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
  padding: const EdgeInsets.all(9.0), // padding global
  child: Column(
    children: [
      // Input + bouton
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: noteController,
              decoration: const InputDecoration(
                labelText: 'Enter a new note',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.green),
            iconSize: 40,
            onPressed: addNote,
            tooltip: 'Add Note',
          ),
        ],
      ),
      const SizedBox(height: 10),
      // Liste des notes
      ListView.builder(
        shrinkWrap: true, 
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index]),
            tileColor: index.isEven ? Colors.grey.shade100 : Colors.white,
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => deleteNote(index),
              tooltip: 'Delete Note',
            ),
          );
        },
      ),
    ],
  ),
),
    );
  }
}
