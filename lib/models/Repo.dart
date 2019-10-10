import 'package:banksdev_flutter/models/Collaborator.dart';

class Repository {
  String id;
  String name;
  String url;
  String updatedAt;
  String pushedAt;
  // List<dynamic> pullRequests;
  List<Collaborator> collaborators;
  // String languages;

  Repository({
    this.id,
    this.name,
    this.url,
    this.updatedAt,
    this.pushedAt,
    // this.pullRequests,
    this.collaborators,
    // this.languages
  });

  factory Repository.fromJson(dynamic repo) {
    return Repository(
      id: repo['id'],
      name: repo['name'],
      url: repo['url'],
      updatedAt: repo['updatedAt'],
      pushedAt: repo['pushedAt'],
      // // pullRequests: repo['pullRequests']['edges']['node'],
      // collaborators: repo['collaborators']['edges']
      //     .map((item) => Collaborator.fromJson(item)) as List<Collaborator>,
      // languages: repo['languages'],
    );
  }
}
