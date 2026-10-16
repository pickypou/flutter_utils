import 'dart:async';
import 'package:flutter/material.dart';

/// A widget that cycles through a list of images automatically with smooth transitions.
///
/// Supports both local asset paths and remote network URLs (`http://`, `https://`).
class ImageSlider extends StatefulWidget {
  /// The image paths or URLs to display in the slider.
  final List<String> imagePaths;

  /// Duration between image transitions.
  final Duration duration;

  /// Animation curve used for the transition.
  final Curve curve;

  /// Whether to apply a fade transition effect between slides.
  final bool useFadeTransition;

  /// Optional width of the slider image.
  final double? width;

  /// Creates an [ImageSlider] widget.
  const ImageSlider({
    super.key,
    required this.imagePaths,
    this.duration = const Duration(seconds: 3),
    this.curve = Curves.easeInOut,
    this.useFadeTransition = true,
    this.width,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  Timer? _timer;

  bool _isNetwork(String path) =>
      path.startsWith('http://') || path.startsWith('https://');

  @override
  void initState() {
    super.initState();
    _startImageChangeTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pre-cache images to avoid white flash
    for (String path in widget.imagePaths) {
      if (_isNetwork(path)) {
        precacheImage(NetworkImage(path), context);
      } else {
        precacheImage(AssetImage(path), context);
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startImageChangeTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imagePaths.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPath = widget.imagePaths[_currentIndex];

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
      child: _isNetwork(currentPath)
          ? Image.network(
              currentPath,
              fit: BoxFit.cover,
              key: ValueKey<int>(_currentIndex),
              width: widget.width,
            )
          : Image.asset(
              currentPath,
              fit: BoxFit.cover,
              key: ValueKey<int>(_currentIndex),
              width: widget.width,
            ),
    );
  }
}
