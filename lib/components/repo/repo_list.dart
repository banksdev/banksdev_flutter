// import 'dart:convert';
import 'package:banksdev_flutter/models/Collaborator.dart';
import 'package:banksdev_flutter/models/Repo.dart';
import 'package:banksdev_flutter/components/Client.dart';
import 'package:banksdev_flutter/components/repo/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class RepoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RepoList();
  }
}

class _RepoList extends State<RepoList> {
  List<Repository> repos;

  @override
  void initState() {
    super.initState();
    getPublicRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: RefreshIndicator(
      child: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (BuildContext context, int index) {
          var repo = repos[index];
          return Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                  child: Container(
                width: 300,
                height: 100,
                child: Column(
                  children: <Widget>[
                    Text(repo.name),
                    Text(repo.url),
                  ],
                ),
              )));
        },
      ),
      onRefresh: getPublicRepos,
    )));
  }

  Future<void> getPublicRepos() async {
    var user = "BBPL";
    var options = QueryOptions(
      document: readRepos,
      variables: <String, dynamic>{'name': user},
    );

    var res = await client.query(options);
    if (res.hasErrors) {
      print(res.errors);
    }
    var reposData = res.data['user']['repositories']['nodes'] as List;
    var _repos = reposData.map((item) {
      var collaboratorsData = item['collaborators']['edges'] as List;
      var collaborators = collaboratorsData.map((item) {
        return Collaborator.fromJson(item);
      });
      var repo = Repository.fromJson(item);
      repo.collaborators = collaborators.toList();
      return repo;
    }).toList();

    setState(() {
      repos = _repos;
    });
  }
}
