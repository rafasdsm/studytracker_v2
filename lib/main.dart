import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/model/localbank.dart';
import 'pages/materiaform.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MateriaFormPage());
  }
}
