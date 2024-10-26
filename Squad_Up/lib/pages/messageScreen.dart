import 'package:flutter/material.dart';

class messageScreen extends StatelessWidget {
  const messageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: const Center( child: Text('no messages',style: TextStyle(fontSize: 40)))
    );
  }
}