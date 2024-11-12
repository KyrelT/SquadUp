import 'package:flutter/material.dart';
import 'package:squad_up/components/my_textfield.dart';
import 'package:squad_up/components/my_button.dart';
import 'package:squad_up/services/auth_service.dart';
import 'package:squad_up/pages/loginScreen.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // passwords match -> create user
    if (passwordController.text == confirmpasswordController.text){
      try {
        _auth.signUpWithEmailPassword(emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text(e.toString()),
              ),
        );
      }
    }

    // passwords dont match -> tell user to fix
    else {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Password don't match"),
            ),
      );
    }
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
                      'Register',
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

                    //confirm password textfield
                    MyTextfield(
                      controller: confirmpasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 20),

                    //Register button
                    MyButton(
                      text: "Register",
                      //onTap: register user,
                      onTap: () => register(context),
                    ),

                    const SizedBox(height:50),

                    // continue with


                    // not a member?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',style:TextStyle(color: Colors.grey.shade500)),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            'Login Now',
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
