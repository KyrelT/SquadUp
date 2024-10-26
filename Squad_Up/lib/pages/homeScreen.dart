import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:squad_up/sideDrawer.dart';
import 'package:squad_up/pages/searchScreen.dart';
import 'package:squad_up/pages/ProfileScreen.dart';
import 'package:squad_up/pages/messageScreen.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int pageIndex = 0;

  List<Widget> widgetList = [
    homeContent(),
    searchScreen(),
    ProfileScreen(),
    messageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Color appBarColor = Colors.grey.shade900;
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.grey.shade400,
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: const Text("SquadUp"),
          ),
          body: Center(child: widgetList[pageIndex]),
          bottomNavigationBar: Container(
            color: Colors.grey.shade900,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
              child: GNav(
                backgroundColor: Colors.grey.shade900,
                color: Colors.white,
                activeColor: Colors.white,
                haptic: true,
                tabBackgroundColor: Colors.grey.shade800,
                gap: 8,
                onTabChange: (index){
                  setState(() {
                    pageIndex = index;
                  });
                },
                padding: EdgeInsets.all(16),
                tabs: [
                  GButton(
                      icon: Icons.home,
                      text: "Home"),
                  GButton(
                      icon: Icons.search,
                      text: "Search"),
                  GButton(
                      icon: Icons.person,
                      text: "Profile"),
                  GButton(
                      icon: Icons.messenger,
                      text: "Messages"),
                ],
              ),
            ),
          ),
          drawer: sideDrawer()
      ),
    );
  }
}

class homeContent extends StatelessWidget {
  const homeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Page Content"),
    );
  }
}
