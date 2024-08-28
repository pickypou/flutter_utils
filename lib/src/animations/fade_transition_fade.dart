import 'package:flutter/material.dart';

class FadeTransitionFade extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const FadeTransitionFade({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
  });

  @override
  _FadeTransitionFadeState createState() => _FadeTransitionFadeState();
}

class _FadeTransitionFadeState extends State<FadeTransitionFade>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
