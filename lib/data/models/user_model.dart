class User {
  String name;
  String email;
  String password;
  String role;
  String number;
  String? token;

  User({required this.name, required this.email, required this.password, required this.role, required this.number,this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      number: json['number'] ?? '',
      token: json['token'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'number': number,
      'token': token
    };
  }
}