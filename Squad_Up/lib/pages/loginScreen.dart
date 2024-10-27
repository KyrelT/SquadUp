import 'package:flutter/material.dart';
import 'package:squad_up/components/my_textfield.dart';
import 'package:squad_up/components/my_button.dart';
import 'package:squad_up/pages/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class loginScreen extends StatefulWidget {
  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {

    // show loading circle
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
    );

    // pop the loading circle after signing in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //logo
              const Icon(
                Icons.lock,
                size:100,
                color: Colors.grey,
              ),

              const SizedBox(height: 25),

              //Login message
              Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 35,
                ),
              ),

              const SizedBox(height: 25),

              //Email textfield
              MyTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              //password textfield
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 15),

              //forgot password
              Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey.shade500)
              ),

              const SizedBox(height: 20),

              //sign in button
              MyButton(
                //onTap: signUserIn,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homeScreen()),
                ),
              ),

              const SizedBox(height:50),

              // continue with


              // not a member?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',style:TextStyle(color: Colors.grey.shade500)),
                  const SizedBox(width: 4),
                  Text(
                    'Register Now',
                    style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}
