import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/screens/home/widgets/chart_widget.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  ScoreCardWidget({required this.userScore, required this.quizzes});

  final int userScore;
  final List<QuizModel> quizzes;

  get questionLength {
    int length = 0;
    quizzes.forEach((quiz) {
      length += quiz.quizQuestions.length;
    });
    return length;
  }

  double get scorePercentage => userScore / questionLength * 100;

  Map<String, String> get scoreCardContent {
    if (scorePercentage >= 100) {
      return {
        'title': 'Parabéns',
        'description':
            'Todos os desafios concluidos, Tenho certeza de que aprendeu bastande coisa :)'
      };
    } else if (scorePercentage >= 50) {
      return {
        'title': 'Bom resultado',
        'description': 'Seu conhecimento está sendo aprimorado :)'
      };
    } else if (scorePercentage >= 1) {
      return {
        'title': 'Continue nesse ritmo',
        'description':
            'Continue realizando os desafios para ampliar seu conhecimento'
      };
    } else {
      return {
        'title': 'Vamos começar',
        'description': 'Complete os desafios e avance em conhecimento'
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.extraLightGrey, width: 1),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ChartWidget(chartPersentage: scorePercentage)),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            scoreCardContent['title']!,
                            style: AppTextStyles.heading,
                          ),
                        ),
                        Text(
                          scoreCardContent['description']!,
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
