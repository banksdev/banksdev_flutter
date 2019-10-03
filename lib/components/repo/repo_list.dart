import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class RepoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RepoList();
  }
}

class _RepoList extends State<RepoList> {
  @override
  void initState() {
    getPublicRepos("BBPL");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Hello world",
        style: TextStyle(color: Colors.black), textAlign: TextAlign.center);
  }
}

void getPublicRepos(String user) async {
  String api = "https://api.github.com/";
  var url = api + "users/" + user + "/repos?type=owner";
  http.get(url).then((response) {
    List<dynamic> req = jsonDecode(response.body);
    req.forEach((element) {
      print(element.name);
    });
    // print(response.body);
  }).catchError((Exception e) {
    print(e);
  });
  // var list = jsonDecode(e.body);
  // print(list);
  // return null;
}
