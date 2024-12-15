import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordInputWidget extends StatefulWidget {
  final double width, height, borderRadius, fontSize;
  final EdgeInsets margin;
  final String placeholderText;
  final Color placeholderColor, inputTextColor, backgroundColor;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const PasswordInputWidget({
    super.key,
    required this.placeholderText,
    this.width = 278,
    this.height = 42,
    this.borderRadius = 8,
    this.fontSize = 17,
    this.margin = const EdgeInsets.all(0),
    this.placeholderColor = const Color(0xFF8E8E93),
    this.inputTextColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.controller,
    this.validator,
  });

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(bottom: 3, left: 16, right: 44);
    const marginBackground = EdgeInsets.only(top: 3);
    return Container(
      margin: widget.margin,
      child: Stack(
        children: [
          Container(
            margin: marginBackground,
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
          Container(
            padding: padding,
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              onTap: widget.onTap,
              obscureText: _isObscured,
              style: TextStyle(
                color: widget.inputTextColor,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                hintText: widget.placeholderText,
                hintStyle: TextStyle(
                  color: widget.placeholderColor,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.normal,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => setState(() => _isObscured = !_isObscured),
              icon: Icon(
                _isObscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                size: widget.fontSize,
                color: widget.inputTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
