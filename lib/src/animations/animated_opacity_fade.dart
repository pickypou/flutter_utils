import 'package:flutter/material.dart';

/// A simple fade-in animation for any widget.
///
/// Example:
/// ```dart
/// AnimatedOpacityFade(
///   duration: Duration(seconds: 2),
///   curve: Curves.easeInOut,
///   child: Image.asset('assets/photo.png'),
/// )
/// ```
class AnimatedOpacityFade extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const AnimatedOpacityFade({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimatedOpacityFade> createState() => _AnimatedOpacityFadeState();
}

class _AnimatedOpacityFadeState extends State<AnimatedOpacityFade>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Opacity(
        opacity: _animation.value,
        child: child,
      ),
      child: widget.child,
    );
  }
}
