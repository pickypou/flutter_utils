import 'package:flutter/material.dart';

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
  _AnimatedOpacityFadeState createState() => _AnimatedOpacityFadeState();
}

class _AnimatedOpacityFadeState extends State<AnimatedOpacityFade> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );
  }
}
