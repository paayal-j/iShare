import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i_share/account_check/account_check.dart';
import 'package:i_share/forget_password/forget_password.dart';
import 'package:i_share/home_screen/home_screen.dart';
import 'package:i_share/sign_up/sign_up_screen.dart';
import 'package:i_share/widgets/button_square.dart';
import 'package:i_share/widgets/input_field.dart';

class Credentials extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailTextController =
      TextEditingController(text: '');
  final TextEditingController _passTextController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: const AssetImage("images/logo1.png"),
              backgroundColor: Color.fromARGB(255, 151, 224, 248),
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
            height: 10.0,
          ),
          InputField(
            hintText: "Enter Password",
            icon: Icons.lock,
            obscureText: true,
            textEditingController: _passTextController,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ForgetPasswordScreen()));
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )),
            ],
          ),
          ButtonSquare(
              text: "Login",
              colors1: Colors.red,
              colors2: Colors.redAccent,
              press: () async {
                try {
                  await _auth.signInWithEmailAndPassword(
                    email: _emailTextController.text.trim().toLowerCase(),
                    password: _passTextController.text.trim(),
                  );
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                } catch (error) {
                  Fluttertoast.showToast(msg: error.toString());
                }
              }),
          AccountCheck(
            login: true,
            press: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => SignUpScreen()));
            },
          )
        ],
      ),
    );
  }
}
