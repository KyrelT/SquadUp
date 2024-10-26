import 'package:flutter/material.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: const Center( child: Text('Settings',style: TextStyle(fontSize: 40)))
    );
  }
}