class User {
  final String name;
  final String email;
  final num id;
  final String password;

  User(this.name, this.email, this.id, this.password);

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['name'] as String,
        json['email'] as String,
        json['id'] as num,
        json['pasword'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'id': id,
        'password': password,
      };
}
