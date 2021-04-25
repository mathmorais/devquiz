import 'dart:convert';

class AnswerModel {
  final String answerContent;
  final bool isRight;

  AnswerModel({required this.answerContent, this.isRight = false});

  Map<String, dynamic> toMap() {
    return {
      'answerContent': answerContent,
      'isRight': isRight,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
        answerContent: map['answerContent'], isRight: map['isRight'] ?? false);
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
}
