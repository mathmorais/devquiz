import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double chartPersentage;

  ChartWidget({required this.chartPersentage});

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(begin: 0.0, end: widget.chartPersentage / 100)
        .animate(_animationController);
    CurvedAnimation(parent: _animationController, curve: Curves.easeInBack);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (ctx, _) => Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: _animation.value,
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
            Text(
              '${widget.chartPersentage.toInt()}%',
              style: AppTextStyles.heading,
            )
          ],
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
