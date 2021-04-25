import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer.model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatefulWidget {
  AnswerWidget(
      {required this.answer,
      required this.onTap,
      required this.isAnswerSelected});

  final AnswerModel answer;
  final VoidCallback onTap;
  final bool isAnswerSelected;

  @override
  createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  get isAnswerSelected => widget.isAnswerSelected;

  Color get _selectedColor =>
      isAnswerSelected ? AppColors.lightGreen : AppColors.white;

  Color get _selectedBorderColor =>
      isAnswerSelected ? AppColors.green : AppColors.lightRed;

  TextStyle get _selectedTextStyle =>
      isAnswerSelected ? AppTextStyles.bodyDarkGreen : AppTextStyles.body;

  BoxDecoration get _selectedIconDecoration => isAnswerSelected
      ? BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.darkGreen,
          border: Border.all(color: AppColors.darkGreen))
      : BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.lightGrey));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: _selectedColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _selectedBorderColor)),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                widget.answer.answerContent,
                style: _selectedTextStyle,
              ),
            ),
            Expanded(
              child: Container(
                width: 24,
                height: 24,
                decoration: _selectedIconDecoration,
                child: Icon(
                  Icons.check,
                  color: AppColors.white,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
