import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Text("Welcome to banksdev",
         style: TextStyle(
           color: Colors.amber, 
           fontSize: 58.0,
           fontFamily: "Raleway"
           ),
         ),
       ),
    );
  }

}