class User {
  String email;

  String phone;
  String userName;

  User({
    required this.email,
    required this.phone,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'], phone: json['phone'], userName: json['name']);
  }
}
