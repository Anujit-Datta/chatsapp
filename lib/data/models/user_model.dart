class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? userId;
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.userId,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    userId = json['userId'];
    token = json['token'];
  }
}
