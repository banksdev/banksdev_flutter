import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text("Hello World!"),
      ),
    );
  }
}
