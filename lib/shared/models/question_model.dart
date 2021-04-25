import 'dart:convert';

import 'package:devquiz/shared/models/answer.model.dart';

class QuestionModel {
  final String questionTitle;
  final List<AnswerModel> questionAnswers;
  static const maxQuestionAnswers = 4;

  QuestionModel({required this.questionTitle, required this.questionAnswers})
      : assert(questionAnswers.length <= maxQuestionAnswers);

  Map<String, dynamic> toMap() {
    return {
      'questionTitle': questionTitle,
      'questionAnswers': questionAnswers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      questionTitle: map['questionTitle'],
      questionAnswers: List<AnswerModel>.from(
          map['questionAnswers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
