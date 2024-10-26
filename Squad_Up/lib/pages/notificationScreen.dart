import 'package:flutter/material.dart';

class notificationScreen extends StatelessWidget {
  const notificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: const Center( child: Text('Notifications',style: TextStyle(fontSize: 40)))
    );
  }
}