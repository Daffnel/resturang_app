import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          Text(
            '1',
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            '2',
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            '3',
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            '4',
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            '5',
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            '6',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
