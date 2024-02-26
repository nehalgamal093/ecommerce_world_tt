class User {
  String email;
  String role;
  String phone;
  String userName;

  User(
      {required this.email,
      required this.phone,
      required this.userName,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        phone: json['phone'],
        userName: json['name'],
        role: json['role']);
  }
}
