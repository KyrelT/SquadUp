import 'package:flutter/material.dart';
import 'package:squad_up/components/my_textfield.dart';
import 'package:squad_up/components/my_button.dart';
import 'package:squad_up/pages/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:squad_up/services/auth_service.dart';


class loginScreen extends StatefulWidget {

  //tap function to register page
  final void Function()? onTap;

  loginScreen({super.key, required this.onTap});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //sign user in method
  void signUserIn(BuildContext context) async {

    // auth service
    final authService = AuthService();

    // show loading circle
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }

    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(e.toString()),
            ),
      );
    }

    // pop the loading circle after signing in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right:20,
            top:50,
            bottom: MediaQuery.of(context).viewInsets.bottom +20,
          ),
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
                    text: "Log in",
                    //onTap: signUserIn,
                    onTap: () => signUserIn(context),
                  ),

                  const SizedBox(height:50),

                  // continue with


                  // not a member?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?',style:TextStyle(color: Colors.grey.shade500)),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Register Now',
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
        )
      )
    );
  }
}
