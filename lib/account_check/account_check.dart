// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;

  const AccountCheck({
    required this.login,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account? " : "Already have an account? ",
          style: const TextStyle(fontSize: 14.0, color: Colors.black),
        ),
        const SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Create Account" : "Log In",
            style: const TextStyle(
                fontSize: 14.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
