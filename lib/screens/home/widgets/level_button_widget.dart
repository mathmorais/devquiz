import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final Difficulty difficulty;
  final ValueChanged<Difficulty> onTap;

  LevelButtonWidget(
      {required this.label, required this.difficulty, required this.onTap})
      : assert(levelButtonDifficulties.contains(label));

  static const Iterable<String> levelButtonDifficulties = [
    "Fácil",
    "Médio",
    "Difícil",
    "Perito"
  ];
  static const styleConfig = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "textColor": AppColors.levelButtonTextFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "textColor": AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "textColor": AppColors.levelButtonTextDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "textColor": AppColors.levelButtonTextPerito
    }
  };

  Color get color => styleConfig[label]!["color"]!;
  Color get borderColor => styleConfig[label]!["borderColor"]!;
  Color get textColor => styleConfig[label]!["textColor"]!;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(difficulty),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: borderColor, width: 1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(label,
                style: GoogleFonts.notoSans(
                  color: textColor,
                  fontSize: 13,
                )),
          ),
        ),
      ),
    );
  }
}
