import 'package:devquiz/screens/answer_result/answer_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(0);
  int totalCorrectQuestions = 0;

  int get currentQuestion => currentQuestionNotifier.value;

  set currentQuestion(int question) => currentQuestionNotifier.value = question;

  void nextQuestion() {
    currentQuestion = currentQuestion + 1;
  }

  void confirmQuestion(
    BuildContext context, {
    required int selectedAnswerIndex,
    required String rightAnswer,
  }) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => AnswerResultScreen.wrong(
                nextTapCallback: nextQuestion, rightAnswer: rightAnswer)));
  }
}
