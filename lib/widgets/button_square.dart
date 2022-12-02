import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ButtonSquare extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color colors1;
  final Color colors2;

  ButtonSquare({
    required this.text,
    required this.press,
    required this.colors1,
    required this.colors2,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.greenAccent,
                    Colors.green,
                  ]),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, -2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: Colors.red,
                ),
                BoxShadow(
                  offset: Offset(2, 2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: Colors.redAccent,
                ),
              ]),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
