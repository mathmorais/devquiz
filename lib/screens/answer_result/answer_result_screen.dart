import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class AnswerResultScreen extends StatelessWidget {
  final String rightAnswer;
  final String _resultImage;
  final String _resultTitle;
  final VoidCallback nextTapCallback;

  AnswerResultScreen.right(
      {required this.rightAnswer, required this.nextTapCallback})
      : _resultImage = 'check',
        _resultTitle = 'Acertou!';

  AnswerResultScreen.wrong(
      {required this.rightAnswer, required this.nextTapCallback})
      : _resultImage = 'error',
        _resultTitle = 'Errou :/';

  void handleNextButton(BuildContext context, {callback}) {
    Navigator.pop(context);

    callback();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages().getProperty(_resultImage),
                width: 130,
                height: 130,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                _resultTitle,
                style: AppTextStyles.heading30w700,
              ),
              SizedBox(
                height: 15,
              ),
              Text.rich(TextSpan(
                  text: 'A resposta correta é ',
                  style: AppTextStyles.body15,
                  children: [
                    TextSpan(text: rightAnswer, style: AppTextStyles.bodyBold15)
                  ])),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                      child: ButtonWidget.purple(
                          label: 'Avançar',
                          onPressed: () => handleNextButton(context,
                              callback: nextTapCallback))),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
