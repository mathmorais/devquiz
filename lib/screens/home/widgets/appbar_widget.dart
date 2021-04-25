import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/screens/home/widgets/score_card_widget.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final List<QuizModel> quizzes;

  AppBarWidget({required this.user, required this.quizzes})
      : super(
            preferredSize: Size.fromHeight(270),
            child: Container(
              height: 270,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text.rich(TextSpan(
                              text: 'Olá, ',
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: user.userName,
                                    style: AppTextStyles.titleBold)
                              ])),
                          Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: Image.network(user.userPhotoUrl,
                                              cacheHeight: 58, cacheWidth: 58)
                                          .image),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColors.purple, width: 2)))
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ScoreCardWidget(
                          userScore: user.score, quizzes: quizzes))
                ],
              ),
            ));
}
