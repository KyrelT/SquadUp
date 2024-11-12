import 'package:flutter/material.dart';
import 'package:squad_up/pages/settingScreen.dart';
import 'package:squad_up/pages/gameScreen.dart';
import 'package:squad_up/pages/notificationScreen.dart';
import 'package:squad_up/pages/FriendScreen.dart';
import 'package:squad_up/pages/loginScreen.dart';
import 'package:squad_up/pages/searchScreen.dart';
import 'package:squad_up/services/auth_service.dart';


class sideDrawer extends StatefulWidget {

  sideDrawer({super.key});

  @override
  State<sideDrawer> createState() => _sideDrawerState();
}

class _sideDrawerState extends State<sideDrawer> {

  final _auth = AuthService();
  //final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column (
            children: [
            // logo
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.face,
                  color:Colors.white,
                  size:40,
                ),
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.search),
                title: Text('S E A R C H'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchScreen()),
                ),
              ),
            ),

            // Game Library
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child:ListTile(
                leading: Icon(Icons.games),
                title: Text('G A M E  L I B R A R Y'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => gameScreen()),
                ),
              ),
            ),

            // Notifications
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child:ListTile(
                leading: Icon(Icons.notifications),
                title: Text('N O T I F I C A T I O N S'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => notificationScreen()),
                ),
              ),
            ),

            // Friends
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.people),
                title: Text('F R I E N D S'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FriendScreen()),
                ),
              ),
            ),

            // Settings
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child:ListTile(
                leading: Icon(Icons.settings),
                title: Text('S E T T I N G S'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => settingScreen()),
                ),
              ),
            ),
          ],
          ),

          // Log Out
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child:ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('L O G O U T'),
              onTap: () {
                signUserOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginScreen(
                      onTap: () {},  // Pass an empty function for onTap
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
