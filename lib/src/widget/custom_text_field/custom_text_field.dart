import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? fontSize;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.keyboardType,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.textColor,
    this.hintColor,
    this.borderColor,
    this.borderRadius,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? Colors.grey[200],
        hintStyle: TextStyle(
          color: hintColor ?? Colors.grey,
          fontSize: fontSize ?? 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0, horizontal: 12.0),
      ),
      style: TextStyle(
        color: textColor ?? Colors.black87,
        fontSize: fontSize ?? 16,
        fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      ),
    );
  }
}
