class Collaborator {
  String id;
  String name;

  Collaborator({this.id, this.name});

  factory Collaborator.fromJson(dynamic curr) {
    return Collaborator(id: curr['node']['id'], name: curr['node']['login']);
  }
}
