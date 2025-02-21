import 'package:flutter/material.dart';

class CropConfig {
  final int index;
  final Alignment alignment;
  final double widthFactor;
  final double heightFactor;

  const CropConfig({
    required this.index,
    this.alignment = Alignment.center,
    this.widthFactor = 1.0,
    this.heightFactor = 1.0,
  });
}