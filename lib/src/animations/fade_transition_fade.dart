import 'package:flutter/material.dart';

/// A widget that performs a smooth fade-in transition using [TweenAnimationBuilder].
class FadeTransitionFade extends StatelessWidget {
  /// The child widget to fade in.
  final Widget child;

  /// The duration of the fade-in animation.
  final Duration duration;

  /// The animation curve to use.
  final Curve curve;

  /// Creates a [FadeTransitionFade] widget.
  const FadeTransitionFade({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
