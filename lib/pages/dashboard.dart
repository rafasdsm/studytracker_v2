import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:studytracker_v2/components/bottomappbar.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CBottomappbar(),
      backgroundColor: Color.fromARGB(255, 252, 248, 242),
    );
  }
}
