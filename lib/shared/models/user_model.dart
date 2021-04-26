import 'dart:convert';

class UserModel {
  final String userName;
  final String userPhotoUrl;
  int score;

  UserModel(
      {required this.userName, required this.userPhotoUrl, this.score = 0});

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userPhotoUrl': userPhotoUrl,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'],
      userPhotoUrl: map['userPhotoUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
