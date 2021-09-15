import 'dart:async';

import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/Login",);
    });
    return Container(
      color: Color(0xFF2E0303),
      child: Center(child: Image.asset("assets/images/Group 83.png")),
    );
  }
}
