import 'package:flutter/material.dart';
import 'package:lookupp/components/signup_button.dart';
import 'package:lookupp/components/dynamic_textfield.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passConfirmController = TextEditingController();

  void signUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  //logo
                  // to be added later, text for now
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  const Text(
                    'for LookUpp',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),

                  const SizedBox(height: 25),

                  //email field
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 20),
                  //password field
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),
                  //password field
                  MyTextField(
                    controller: passConfirmController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  //sign in button
                  SignupButton(
                    onTap: signUp,
                    // TODO: have sign up go back to login page
                    // may be easier to have user sign in after sign up to
                    // not have to duplicate flow (instructions, etc.)
                  ),
                  const SizedBox(height: 50),
                  //sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Log In'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
