import 'package:flutter/material.dart';

class searchScreen extends StatelessWidget {
  const searchScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: const Center( child: Text('Search',style: TextStyle(fontSize: 40)))
    );
  }
}
