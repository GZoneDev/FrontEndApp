import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final double width, height, fontSize, borderRadius;
  final Color placeholderColor, inputTextColor, backgroundColor;
  final EdgeInsets margin, padding;
  final String placeholder;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const TextInputWidget({
    super.key,
    required this.placeholder,
    this.width = 278,
    this.height = 42,
    this.borderRadius = 8,
    this.fontSize = 17,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.only(bottom: 3, left: 16, right: 16),
    this.placeholderColor = const Color(0xFF8E8E93),
    this.inputTextColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    var marginBackground = EdgeInsets.only(top: 3);
    return Container(
      margin: margin,
      child: Stack(
        children: [
          Container(
            margin: marginBackground,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          Container(
            padding: padding,
            child: TextFormField(
              controller: controller,
              validator: validator,
              onTap: onTap,
              style: TextStyle(
                color: inputTextColor,
                fontSize: fontSize,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: placeholderColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
