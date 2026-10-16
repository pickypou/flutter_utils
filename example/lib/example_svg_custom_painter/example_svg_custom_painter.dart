import 'package:flutter/material.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

/// A showcase widget displaying customizable comic speech and thought bubbles.
class ExampleSvgCustomPainter extends StatefulWidget {
  /// Base width of the demo bubble.
  final double width;

  /// Base height of the demo bubble.
  final double height;

  /// Horizontal text offset.
  final double textXOffset;

  /// Vertical text offset.
  final double textYOffset;

  /// Creates an [ExampleSvgCustomPainter] showcase.
  const ExampleSvgCustomPainter({
    super.key,
    this.width = 320,
    this.height = 160,
    this.textXOffset = 0,
    this.textYOffset = 0,
  });

  @override
  State<ExampleSvgCustomPainter> createState() =>
      _ExampleSvgCustomPainterState();
}

class _ExampleSvgCustomPainterState extends State<ExampleSvgCustomPainter> {
  BubbleType _selectedType = BubbleType.thought;
  BubbleTailPosition _selectedTail = BubbleTailPosition.bottomLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Type selector
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 8,
          children: [
            _buildTypeChip(
              label: '💬 Bulle de parole (Speech)',
              isSelected: _selectedType == BubbleType.speech,
              onSelected: () {
                setState(() => _selectedType = BubbleType.speech);
              },
            ),
            _buildTypeChip(
              label: '💭 Nuage de pensée (Thought)',
              isSelected: _selectedType == BubbleType.thought,
              onSelected: () {
                setState(() => _selectedType = BubbleType.thought);
              },
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Tail direction selector
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTailChip('Bas-Gauche', BubbleTailPosition.bottomLeft),
              const SizedBox(width: 8),
              _buildTailChip('Bas-Droite', BubbleTailPosition.bottomRight),
              const SizedBox(width: 8),
              _buildTailChip('Haut-Gauche', BubbleTailPosition.topLeft),
              const SizedBox(width: 8),
              _buildTailChip('Haut-Droite', BubbleTailPosition.topRight),
              const SizedBox(width: 8),
              _buildTailChip('Sans queue', BubbleTailPosition.none),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Live bubble preview
        Center(
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: SvgCustomPainter(
                config: BubbleConfig(
                  type: _selectedType,
                  tailPosition: _selectedTail,
                  borderColor: _selectedType == BubbleType.speech
                      ? const Color(0xFFFBBF24) // Amber 400
                      : const Color(0xFF38BDF8), // Sky 400
                  fillColor: _selectedType == BubbleType.speech
                      ? const Color(0xFF292518)
                      : const Color(0xFF0C2433),
                  strokeWidth: 2.5,
                  text: _selectedType == BubbleType.speech
                      ? "Bonjour ! Je suis une bulle BD dynamique avec queue orientable."
                      : "Hmm... Je suis un nuage de pensée avec 12 lobes et bulles descendantes !",
                  textStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _selectedType == BubbleType.speech
                        ? const Color(0xFFFEF3C7)
                        : const Color(0xFFE0F2FE),
                  ),
                  width: widget.width,
                  height: widget.height,
                  textXOffset: widget.textXOffset,
                  textYOffset: widget.textYOffset,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTypeChip({
    required String label,
    required bool isSelected,
    required VoidCallback onSelected,
  }) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      selectedColor: const Color(0xFF6366F1), // Vibrant Indigo
      backgroundColor: const Color(0xFF0F172A), // Dark Slate
      labelStyle: TextStyle(
        fontSize: 13,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        color: isSelected ? Colors.white : const Color(0xFFE2E8F0),
      ),
      side: BorderSide(
        color: isSelected ? const Color(0xFF818CF8) : const Color(0xFF475569),
        width: 1.2,
      ),
      checkmarkColor: Colors.white,
    );
  }

  Widget _buildTailChip(String label, BubbleTailPosition position) {
    final isSelected = _selectedTail == position;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() => _selectedTail = position);
        }
      },
      selectedColor: const Color(0xFF6366F1), // Vibrant Indigo
      backgroundColor: const Color(0xFF0F172A), // Dark Slate
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        color: isSelected ? Colors.white : const Color(0xFFE2E8F0),
      ),
      side: BorderSide(
        color: isSelected ? const Color(0xFF818CF8) : const Color(0xFF475569),
        width: 1.2,
      ),
      checkmarkColor: Colors.white,
    );
  }
}
