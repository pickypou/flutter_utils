class CropConfig {
  final int index;
  final double offsetY;
  final double heightFactor; // Nouveau paramètre pour le recadrage

  const CropConfig({
    required this.index,
    this.offsetY = 0,
    this.heightFactor = 1.0, // Par défaut, aucune réduction de hauteur
  });
}