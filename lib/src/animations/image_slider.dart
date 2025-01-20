import 'package:flutter/material.dart';
import 'dart:async';

class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;
  final Duration duration;
  final Curve curve;
  final bool useFadeTransition;
  final double? width;

  const ImageSlider({
    super.key,
    required this.imagePaths,
    this.duration = const Duration(seconds: 3),
    this.curve = Curves.easeInOut,
    this.useFadeTransition = true,
    this.width,
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startImageChangeTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startImageChangeTimer() {
    _timer = Timer(widget.duration, () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imagePaths.length;
        });
        _startImageChangeTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      switchInCurve: widget.curve,
      switchOutCurve: widget.curve,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return widget.useFadeTransition
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : child;
      },
      child: Image.asset(
        widget.imagePaths[_currentIndex],
        fit: BoxFit.cover,
        key: ValueKey<int>(_currentIndex),
        width: widget.width,
      ),
    );
  }
}