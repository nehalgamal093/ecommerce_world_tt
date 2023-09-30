// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserReview {
  String? id;
  String? name;
  UserReview({
    this.id,
    this.name,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) {
    return UserReview(id: json['_id'], name: json['name']);
  }
}
