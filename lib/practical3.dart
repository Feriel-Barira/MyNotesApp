import 'package:flutter/material.dart';
// Import the new StatefulWidget from the pages folder
import 'package:flutter_app/pages/my_notes_page.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My Flutter App',
      // c. Replace the Center widget with MyNotesPage
      home: MyNotesPage(title: 'My Notes App 📝'),
    ),
  );
}