class User {
  final int id;
  final String name, email, token;

  const User(
      {required this.id,
      required this.name,
      required this.email,
      required this.token});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        token: json["token"]);
  }
  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'token':token,
    };
  }
}
