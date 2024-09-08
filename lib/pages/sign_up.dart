import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lookupp/components/signup_button.dart';
import 'package:lookupp/components/dynamic_textfield.dart';
import 'package:lookupp/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// This class is a StatelessWidget that builds the UI for the sign up page.
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  // Initialize text controllers for email, password, and password confirmation.
  //
  // These controllers will be used to get the text input from the user.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passConfirmController = TextEditingController();

  // Initialize Firebase Auth from AuthService class
  final AuthService _authService = AuthService();

  /// This function is called when the user taps the sign up button.
  ///
  /// It will attempt to sign up the user with the email and password provided.
  /// If the passwords do not match, a toast will be shown to the user.
  /// If the sign up is successful, the user will be navigated back to the login page.
  /// If there is an error during sign up, a toast will be shown to the user.
  void signUp(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = passConfirmController.text.trim();

    if (password != confirmPassword) {
      Fluttertoast.showToast(
          msg: 'Passwords do not match',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }

    final currentContext = context;

    _authService.signup(email: email, password: password).then((_) {
      // Use a closure to capture the context
      if (mounted) {
        Navigator.pop(currentContext);
      }
    }).catchError((e) {
      Fluttertoast.showToast(
          msg: 'Error during sign up: $e',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    });
  }

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
                  //TODO: logo
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
                  //TODO: fix context issue
                  SignupButton(onTap: () => signUp(context)),
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
