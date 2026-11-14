import 'package:flutter/material.dart';
import 'package:studytracker_v2/pages/materiaform.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MateriaFormPage());
  }
}
