import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color _backgroundColor;
  final Color _color;
  final Color? _borderColor;
  final VoidCallback onPressed;
  final bool isBlocked;

  ButtonWidget.green(
      {required String label,
      required VoidCallback onPressed,
      isBlocked = false})
      : this.label = label,
        this._backgroundColor = AppColors.darkGreen,
        this._color = AppColors.white,
        this._borderColor = AppColors.darkGreen,
        this.onPressed = onPressed,
        this.isBlocked = isBlocked;

  ButtonWidget.white(
      {required String label,
      required VoidCallback onPressed,
      isBlocked = false})
      : this.label = label,
        this._backgroundColor = AppColors.white,
        this._color = AppColors.lightGrey,
        this._borderColor = AppColors.extraLightGrey,
        this.onPressed = onPressed,
        this.isBlocked = isBlocked;

  ButtonWidget.tranparent(
      {required String label,
      required VoidCallback onPressed,
      isBlocked = false})
      : this.label = label,
        this._backgroundColor = Colors.transparent,
        this._color = AppColors.grey,
        this._borderColor = Colors.transparent,
        this.onPressed = onPressed,
        this.isBlocked = isBlocked;

  ButtonWidget.purple(
      {required String label,
      required VoidCallback onPressed,
      isBlocked = false})
      : this.label = label,
        this._backgroundColor = AppColors.purple,
        this._color = AppColors.white,
        this._borderColor = AppColors.lightGrey,
        this.onPressed = onPressed,
        this.isBlocked = isBlocked;

  Color get backgroundColor =>
      isBlocked ? AppColors.extraLightGrey.withOpacity(0.9) : _backgroundColor;

  Color? get borderColor =>
      isBlocked ? AppColors.extraLightGrey.withOpacity(0.9) : _borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 3.5),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: isBlocked
              ? MaterialStateProperty.all(Colors.transparent)
              : MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0.08)),
          side: MaterialStateProperty.all(
              BorderSide(width: 1, color: borderColor ?? _color)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: !isBlocked ? onPressed : () {},
        child: Text(label,
            style: GoogleFonts.notoSans(
              color: _color,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
      ),
    );
  }
}
