class Sender {
  String? name;
  String? email;
  String? userId;

  Sender({this.name, this.email, this.userId});

  Sender.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['userId'] = userId;
    return data;
  }
}