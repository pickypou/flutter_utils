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
            ChoiceChip(
              label: const Text('💬 Bulle de parole (Speech)'),
              selected: _selectedType == BubbleType.speech,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _selectedType = BubbleType.speech);
                }
              },
            ),
            ChoiceChip(
              label: const Text('💭 Nuage de pensée (Thought)'),
              selected: _selectedType == BubbleType.thought,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _selectedType = BubbleType.thought);
                }
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

  Widget _buildTailChip(String label, BubbleTailPosition position) {
    final isSelected = _selectedTail == position;
    return ChoiceChip(
      label: Text(label, style: const TextStyle(fontSize: 12)),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() => _selectedTail = position);
        }
      },
    );
  }
}
