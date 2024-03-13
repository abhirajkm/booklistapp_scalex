import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? color;
  final Color titleColor;
  final Color borderColor;
  final double radius;
  final bool loading;
  final double height;
  final double? width;
  final TextStyle? buttonStyle;

  const Button(
      {super.key,
      required this.title,
      this.onPressed,
      this.color = Colors.purple,
      this.borderColor = Colors.transparent,
      required this.radius,
      required this.loading,
      this.buttonStyle,
      this.height = 50.0,
      this.width,
      this.titleColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 3.0,
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
              side: BorderSide(color: borderColor)),
        ),
        onPressed: onPressed,
        child: loading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                ),
              )
            : Text(
                title,
                style: buttonStyle ??
                    TextStyle(
                        color: titleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
