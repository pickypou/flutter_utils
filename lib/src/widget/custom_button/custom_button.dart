import 'package:flutter/material.dart';

/// A customizable button widget wrapping Flutter's [ElevatedButton] with flexible styling options.
class CustomButton extends StatelessWidget {
  /// Callback executed when the button is tapped.
  final VoidCallback onPressed;

  /// The text displayed on the button.
  final String text;

  /// Optional text style for the button label.
  final TextStyle? textStyle;

  /// Background color of the button.
  final Color? backgroundColor;

  /// Text and icon color of the button.
  final Color? foregroundColor;

  /// Optional fixed width for the button.
  final double? width;

  /// Optional fixed height for the button.
  final double? height;

  /// Border radius of the button corners.
  final double? borderRadius;

  /// Optional border side styling.
  final BorderSide? border;

  /// Elevation of the button shadow.
  final double? elevation;

  /// Shadow color of the button.
  final Color? shadowColor;

  /// Internal padding for the button.
  final EdgeInsetsGeometry? padding;

  /// Optional leading icon displayed before the label text.
  final Widget? icon;

  /// Creates a [CustomButton] widget.
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
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        side: border ?? BorderSide.none,
      ),
    );

    // Contenu texte ou texte + icône
    Widget buttonContent = Text(
      text,
      style: textStyle ??
          const TextStyle(
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
          Flexible(child: buttonContent),
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
