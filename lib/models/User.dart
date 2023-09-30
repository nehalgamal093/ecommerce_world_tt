class User {
  String email;
  String password;
  String phone;
  String userName;

  User({
    required this.email,
    required this.password,
    required this.phone,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        userName: json['name']);
  }
}
