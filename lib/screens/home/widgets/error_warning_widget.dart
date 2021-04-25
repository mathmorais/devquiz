import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ErroWarningWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Image.asset(AppImages.error),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Text.rich(
                  TextSpan(
                      text: 'Ocorreu um ',
                      style: AppTextStyles.heading25,
                      children: [
                        TextSpan(
                            text: 'Erro ',
                            style: AppTextStyles.headingDarkRed25),
                        TextSpan(text: ':(', style: AppTextStyles.heading25)
                      ]),
                )),
            Text(
              'Ocorreu um erro durante o carregamento.\nTente reiniciar a sua aplicação.',
              style: AppTextStyles.body15,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
