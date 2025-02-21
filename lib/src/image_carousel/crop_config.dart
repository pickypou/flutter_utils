/// Configuration pour recadrer une image dans le carrousel.
class CropConfig {
  final int index;
  final double offsetY;
  final double heightFactor;

  const CropConfig({
    required this.index,
    this.offsetY = 0,
    this.heightFactor = 1.0,
  });
}