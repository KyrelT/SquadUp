import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: const Center( child: Text('Friends',style: TextStyle(fontSize: 40)))
    );
  }
}
