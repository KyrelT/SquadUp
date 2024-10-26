import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
      body: const Center( child: Text('Profile',style: TextStyle(fontSize: 40)))
    );
  }
}
