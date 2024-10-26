import 'package:flutter/material.dart';
import 'package:squad_up/pages/settingScreen.dart';
import 'package:squad_up/pages/gameScreen.dart';
import 'package:squad_up/pages/notificationScreen.dart';
import 'package:squad_up/pages/FriendScreen.dart';
import 'package:squad_up/pages/loginScreen.dart';


class sideDrawer extends StatefulWidget {
  const sideDrawer({super.key});

  @override
  State<sideDrawer> createState() => _sideDrawerState();
}

class _sideDrawerState extends State<sideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade500,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text("Kai"), accountEmail: Text("kai2@gmail.com"),decoration: BoxDecoration(color: Colors.grey.shade900),),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.games),
            title: Text('Game Library'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => gameScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => notificationScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Friends'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FriendScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => settingScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => loginScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
