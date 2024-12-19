import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'text_input_widget.dart';

class PasswordInputWidget extends StatefulWidget {
  final double width, height, borderRadius, fontSize;
  final EdgeInsets margin;
  final String placeholderText;
  final String? errorMessage;
  final Color placeholderColor, inputTextColor, backgroundColor;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final Widget? helpWidget;

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
    this.errorMessage,
    this.helpWidget,
  });

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(left: 16, right: 44);
    return Container(
      margin: widget.margin,
      child: Stack(
        children: [
          TextInputWidget(
            placeholder: widget.placeholderText,
            obscureText: _isObscured,
            padding: padding,
            errorMessage: widget.errorMessage,
            onTap: widget.onTap,
            helpWidget: widget.helpWidget,
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
          ),
        ],
      ),
    );
  }
}
