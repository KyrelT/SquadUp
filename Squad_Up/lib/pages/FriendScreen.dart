import 'package:flutter/material.dart';
import 'package:squad_up/components/user_tile.dart';
import 'package:squad_up/pages/chat_page.dart';
import 'package:squad_up/services/chat/chatservices.dart';
import 'package:squad_up/services/auth_service.dart';

class FriendScreen extends StatelessWidget {
  FriendScreen ({super.key});

  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          title: const Text("Friends"),
          backgroundColor: Colors.black38,
        ),
      body: _buildUserList(),
    );
  }

  //build a list of users except for the current logged in user
  Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context,snapshot){
          // error
          if (snapshot.hasError){
            return const Text("Error");
          }

          // loading
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Text("Loading..");
          }

          // return list of friends
          return ListView(
            children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context)).toList(),
          );
        },
    );
  }

  //build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // display all users except current user
    if (userData["email"] != _authService.getCurrentUser()!.email){
      return UserTile(
        text: userData["email"],
        onTap: (){
          // tapped on a user -> go to chat page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage(
              receiverEmail: userData["email"],
              receiverID: userData["uid"],
            ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
