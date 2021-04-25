import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/screens/challenge/quiz_controller.dart';
import 'package:devquiz/screens/challenge/widgets/answer_widget.dart';
import 'package:devquiz/shared/models/answer.model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final QuizController quizController;

  QuizWidget({required this.question, required this.quizController});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int get selectedQuestion => widget.quizController.selectedAnswerIndex;
  set selectedQuestion(int value) =>
      widget.quizController.selectedAnswerIndex = value;

  List<AnswerModel> get answers => widget.question.questionAnswers;

  List<ValueListenableBuilder> handleLoadAnswers() {
    List<ValueListenableBuilder<int>> _answers = [];

    for (int index = 0; index < answers.length; index++) {
      final answerWidgets = ValueListenableBuilder<int>(
          valueListenable: widget.quizController.selectedAnswerIndexNotifier,
          builder: (value, ctx, _) => AnswerWidget(
              answer: answers[index],
              isAnswerSelected: selectedQuestion == index,
              onTap: () => selectedQuestion = index));

      _answers.add(answerWidgets);
    }

    return _answers;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 24),
            child: Text(
              widget.question.questionTitle,
              style: AppTextStyles.heading20,
            ),
          ),
          ...handleLoadAnswers()
        ],
      ),
    );
  }
}
