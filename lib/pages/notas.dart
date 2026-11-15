import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/components/bottomappbar.dart';

class NotasPage extends StatefulWidget {
  const new({super.key});

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CBottomappbar(),
      backgroundColor: Color.fromARGB(255, 252, 248, 242),
    );
  }
}
