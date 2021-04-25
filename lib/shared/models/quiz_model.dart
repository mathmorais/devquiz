import 'dart:convert';

import 'package:devquiz/shared/models/question_model.dart';

enum Difficulty { facil, medio, dificil, perito }

extension DifficultyStringExtension on String {
  Difficulty parse() => {
        'facil': Difficulty.facil,
        'medio': Difficulty.medio,
        'dificil': Difficulty.dificil,
        'perito': Difficulty.perito
      }[this]!;
}

extension Difficultyxtension on Difficulty {
  String parse() => {
        Difficulty.facil: "facil",
        Difficulty.medio: "medio",
        Difficulty.dificil: "dificil",
        Difficulty.perito: "perito"
      }[this]!;
}

class QuizModel {
  final String quizTitle;
  final List<QuestionModel> quizQuestions;
  final int quizQuestionsAnswered;
  final String quizImage;
  final Difficulty quizDifficulty;

  QuizModel(
      {required this.quizTitle,
      required this.quizQuestions,
      this.quizQuestionsAnswered = 0,
      required this.quizImage,
      required this.quizDifficulty});

  Map<String, dynamic> toMap() {
    return {
      'quizTitle': quizTitle,
      'quizQuestions': quizQuestions.map((x) => x.toMap()).toList(),
      'quizQuestionsAnswered': quizQuestionsAnswered,
      'quizImage': quizImage,
      'quizDifficulty': quizDifficulty.parse(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
        quizTitle: map['quizTitle'],
        quizQuestions: List<QuestionModel>.from(
            map['quizQuestions']?.map((x) => QuestionModel.fromMap(x))),
        quizQuestionsAnswered: map['quizQuestionsAnswered'],
        quizImage: map['quizImage'],
        quizDifficulty: map['quizDifficulty'].toString().parse());
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
