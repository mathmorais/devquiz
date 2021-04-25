import 'package:flutter/material.dart';

class QuizController {
  ValueNotifier<int> selectedAnswerIndexNotifier = ValueNotifier(-1);

  set selectedAnswerIndex(int value) =>
      selectedAnswerIndexNotifier.value = value;

  int get selectedAnswerIndex => selectedAnswerIndexNotifier.value;

  void clearSelectedAnswers() {
    selectedAnswerIndex = -1;
  }
}
