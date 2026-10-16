import 'package:flutter/material.dart';

/// A customizable input text field widget wrapping Flutter's [TextField].
class CustomTextField extends StatelessWidget {
  /// The hint text placeholder displayed when input is empty.
  final String hintText;

  /// Optional text editing controller to manage the input text.
  final TextEditingController? controller;

  /// The keyboard type for the input field.
  final TextInputType keyboardType;

  /// Whether the input characters should be hidden (for passwords).
  final bool obscureText;

  /// Optional icon placed at the beginning of the text field.
  final Widget? prefixIcon;

  /// Optional icon placed at the end of the text field.
  final Widget? suffixIcon;

  /// Background fill color for the text field.
  final Color? fillColor;

  /// Text color of the input text.
  final Color? textColor;

  /// Color of the hint placeholder text.
  final Color? hintColor;

  /// Border outline color.
  final Color? borderColor;

  /// Border corner radius.
  final double? borderRadius;

  /// Font size for the text and hint.
  final double? fontSize;

  /// Creates a [CustomTextField] widget.
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
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ??
            theme.inputDecorationTheme.fillColor ??
            theme.colorScheme.surfaceContainerHighest,
        hintStyle: TextStyle(
          color: hintColor ?? theme.hintColor,
          fontSize: fontSize ?? 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
      style: TextStyle(
        color: textColor ?? theme.textTheme.bodyLarge?.color,
        fontSize: fontSize ?? 16,
        fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      ),
    );
  }
}
