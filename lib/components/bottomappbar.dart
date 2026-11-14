import 'package:flutter/material.dart';

class CBottomappbar extends StatelessWidget {
  CBottomappbar({super.key});

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
