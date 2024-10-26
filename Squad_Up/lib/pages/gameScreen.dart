import 'package:flutter/material.dart';

class gameScreen extends StatelessWidget {
  const gameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: const Center( child: Text('Game Library',style: TextStyle(fontSize: 40)))
    );
  }
}