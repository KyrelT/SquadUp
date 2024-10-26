import 'package:flutter/material.dart';
import 'package:squad_up/pages/FriendScreen.dart';
import 'package:squad_up/pages/ProfileScreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:squad_up/pages/messageScreen.dart';
import 'package:squad_up/sideDrawer.dart';
import 'package:squad_up/pages/homeScreen.dart';
import 'package:squad_up/pages/loginScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget { // no dynamic data if stateless
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) { // flutter will call whenever flutter needs to build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginScreen(),
    );
  }
}

