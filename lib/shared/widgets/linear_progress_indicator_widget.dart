import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {
  final double progressValue;
  const LinearProgressIndicatorWidget({required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppColors.chartSecondary,
      minHeight: 4,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
      value: progressValue,
    );
  }
}
