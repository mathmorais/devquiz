import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/screens/home/home_screen.dart';
import 'package:devquiz/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ResultScreen extends StatelessWidget {
  final String quizName;
  final int rightAnswers;
  final int totalAnswers;

  ResultScreen(
      {required this.quizName,
      required this.rightAnswers,
      required this.totalAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 65),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  AppImages.trophy,
                  width: 280,
                  height: 280,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text('Parabéns!', style: AppTextStyles.heading30w700),
              SizedBox(
                height: 15,
              ),
              Text.rich(
                TextSpan(
                    text: 'Você concluiu\n',
                    style: AppTextStyles.body15,
                    children: [
                      TextSpan(
                          text: '$quizName\n', style: AppTextStyles.bodyBold15),
                      TextSpan(text: 'com $rightAnswers de $totalAnswers')
                    ]),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                      child: ButtonWidget.purple(
                          label: 'Compartilhar',
                          onPressed: () => Share.share(
                              'Acabei de terminar o desafio $quizName com com $rightAnswers de $totalAnswers acertos!'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: ButtonWidget.tranparent(
                          label: 'Voltar ao ínicio',
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => HomeScreen()))))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
