import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  final VoidCallback onTap;

  QuizCardWidget({required this.quiz, required this.onTap});

  double get _progressPercentage =>
      quiz.quizQuestionsAnswered / quiz.quizQuestions.length;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.extraLightGrey, width: 1),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              child: Image.asset(AppImages().getProperty(quiz.quizImage)),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                quiz.quizTitle,
                style: AppTextStyles.heading15,
                semanticsLabel: 'Titulo',
              ),
            ),
            Row(children: [
              Expanded(
                  flex: 1,
                  child: Text(
                      '${quiz.quizQuestionsAnswered} de ${quiz.quizQuestions.length}',
                      style: AppTextStyles.body11)),
              Expanded(
                  flex: 2,
                  child: LinearProgressIndicatorWidget(
                    progressValue: _progressPercentage,
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
