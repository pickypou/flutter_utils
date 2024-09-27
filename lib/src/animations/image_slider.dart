import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;
  final Duration duration;
  final Curve curve;
  final bool useFadeTransition;
  final double? width;
  

  const ImageSlider({
    Key? key,
    required this.imagePaths,
    this.duration = const Duration(seconds: 3),
    this.curve = Curves.easeInOut,
    this.useFadeTransition = true,
    this.width,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startImageChangeTimer();
  }

  void _startImageChangeTimer() {
    Future.delayed(widget.duration, _changeImage);
  }

  void _changeImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.imagePaths.length;
    });
    _startImageChangeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      switchInCurve: widget.curve,
      switchOutCurve: widget.curve,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
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