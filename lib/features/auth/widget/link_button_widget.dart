import 'package:flutter/material.dart';

class LinkButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final double wight, height, fontSize, borderRadius;
  final Color backgroundColor, fontColor;
  final EdgeInsets padding;
  final String text;

  const LinkButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.wight = 278,
    this.height = 50,
    this.fontSize = 17,
    this.borderRadius = 12,
    this.backgroundColor = const Color(0xFF32ADE6),
    this.fontColor = Colors.white,
    this.padding = const EdgeInsets.all(14),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        fixedSize: Size(wight, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          color: fontColor,
        ),
      ),
    );
  }
}
