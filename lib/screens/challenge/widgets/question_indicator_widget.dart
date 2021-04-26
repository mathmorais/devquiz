import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int questionsLength;

  double get currentProgress => currentQuestion / questionsLength;

  QuestionIndicatorWidget(
      {required this.currentQuestion, required this.questionsLength});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.arrow_back,
              size: 20,
              color: AppColors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Questão $currentQuestion',
                          style: AppTextStyles.body15),
                      Text('de $questionsLength', style: AppTextStyles.body15)
                    ],
                  ),
                ),
                LinearProgressIndicatorWidget(
                  progressValue: currentProgress,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
