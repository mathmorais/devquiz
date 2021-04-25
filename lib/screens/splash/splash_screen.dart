import 'package:devquiz/core/core.dart';
import 'package:devquiz/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    () async {
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacement(
          context,MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
