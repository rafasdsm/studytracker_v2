import 'package:material_ui/material_ui.dart';

class CBottomappbar extends StatelessWidget {
  const CBottomappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey.shade400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 20,
        children: [
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.dashboard, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.book, color: Colors.blue),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.grade, color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}
