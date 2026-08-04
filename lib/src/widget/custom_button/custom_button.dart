import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BorderSide? border;
  final double? elevation;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Construction du style du bouton
    final btnStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
      elevation: elevation ?? 2.0,
      shadowColor: shadowColor ?? theme.shadowColor,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        side: border ?? BorderSide.none,
      ),
    );

    // Contenu texte ou texte + icône
    Widget buttonContent = Text(
      text,
      style: textStyle ?? const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );

    if (icon != null) {
      buttonContent = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          const SizedBox(width: 8),
          buttonContent,
        ],
      );
    }

    Widget button = ElevatedButton(
      onPressed: onPressed,
      style: btnStyle,
      child: buttonContent,
    );

    // Encapsulation dans un SizedBox si on force des dimensions
    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: button,
      );
    }

    return button;
  }
}
