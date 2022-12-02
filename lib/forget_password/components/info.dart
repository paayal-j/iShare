import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i_share/account_check/account_check.dart';
import 'package:i_share/log_in/login_screen.dart';
import 'package:i_share/sign_up/sign_up_screen.dart';
import 'package:i_share/widgets/button_square.dart';
import 'package:i_share/widgets/input_field.dart';

class Credentials extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailTextController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Center(
            child: Image.asset(
              "images/forget.png",
              width: 250.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        InputField(
          hintText: "Enter Email",
          icon: Icons.email_rounded,
          obscureText: false,
          textEditingController: _emailTextController,
        ),
        const SizedBox(
          height: 15.0,
        ),
        ButtonSquare(
            text: "Send Link",
            colors1: Colors.green,
            colors2: Colors.greenAccent,
            press: () async {
              try {
                await _auth.sendPasswordResetEmail(
                    email: _emailTextController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.amber,
                    content: Text(
                      "Password reset mail sent successfully",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                );
              } on FirebaseAuthException catch (error) {
                Fluttertoast.showToast(msg: error.toString());
              }
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginScreen()));
            }),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => SignUpScreen()));
          },
          child: const Center(child: Text("Create Account")),
        ),
        AccountCheck(
            login: false,
            press: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginScreen()));
            }),
      ]),
    );
  }
}
