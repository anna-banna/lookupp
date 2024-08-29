import 'package:flutter/material.dart';
import 'package:lookupp/components/dynamic_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                //logo
                // to be added later, text for now
                const Text(
                  'Lookupp',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),

                const SizedBox(height: 100),

                //email field
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                //password field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                )
                //forgot password

                //sign in button

                //sign up
              ],
            ),
          ),
        ));
  }
}
