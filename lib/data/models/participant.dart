class Participants {
  String? id;
  String? name;
  String? email;
  String? userId;

  Participants({this.id, this.name, this.email, this.userId});

  Participants.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    userId = json['userId'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['_id'] = id;
  //   data['name'] = name;
  //   data['email'] = email;
  //   data['userId'] = userId;
  //   return data;
  // }
}