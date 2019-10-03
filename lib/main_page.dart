import 'package:banksdev_flutter/components/random_text.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: <Widget>[
          MaterialButton(
            onPressed: () => print("hello"),
            child: Text("Hello click"),
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(
            "Welcome to banksdev",
            style: TextStyle(
                color: Colors.amber, fontSize: 58.0, fontFamily: "Raleway"),
          ),
          RandomText()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text("god"), icon: Icon(Icons.access_alarm)),
          BottomNavigationBarItem(
              title: Text("no"), icon: Icon(Icons.access_alarm))
        ],
        onTap: (int i) => print("hellow bottom"),
      ),
    );
  }
}
