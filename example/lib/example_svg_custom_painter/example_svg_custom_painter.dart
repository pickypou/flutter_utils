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
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Bulles BD & Nuages de Pensée (SvgCustomPainter)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Bulle entièrement vectorielle sans dépendance SVG externe. Choisissez le type et l\'orientation de la queue :',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Type selector
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
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
          const SizedBox(height: 12),

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
                        ? Colors.amberAccent
                        : Colors.cyanAccent,
                    fillColor: _selectedType == BubbleType.speech
                        ? const Color(0xFF2A2810)
                        : const Color(0xFF0F2530),
                    strokeWidth: 2.5,
                    text: _selectedType == BubbleType.speech
                        ? "Bonjour ! Je suis une bulle de dialogue avec une queue personnalisable."
                        : "Hmm... Je suis un nuage de pensée avec des lobes soignés et des bulles descendantes !",
                    textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _selectedType == BubbleType.speech
                          ? Colors.amber.shade100
                          : Colors.cyan.shade100,
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
      ),
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
