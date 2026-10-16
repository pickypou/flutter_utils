import 'package:flutter/material.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

/// Interactive showcase displaying various configurations of [CustomButton].
class ExampleCustomButton extends StatelessWidget {
  /// Creates an [ExampleCustomButton] showcase.
  const ExampleCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        // 1. Bouton Principal Vibrant
        CustomButton(
          text: 'Action Principale',
          icon: const Icon(Icons.bolt, color: Colors.white),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('⚡ Action principale déclenchée !'),
                backgroundColor: Color(0xFF6366F1),
                duration: Duration(seconds: 2),
              ),
            );
          },
          backgroundColor: const Color(0xFF6366F1),
          foregroundColor: Colors.white,
          borderRadius: 12.0,
          elevation: 6.0,
          shadowColor: const Color(0xFF6366F1).withValues(alpha: 0.5),
        ),

        // 2. Bouton Succès / Secondaire
        CustomButton(
          text: 'Succès & Validation',
          icon:
              const Icon(Icons.check_circle_outline, color: Color(0xFF10B981)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ Validation enregistrée avec succès !'),
                backgroundColor: Color(0xFF10B981),
                duration: Duration(seconds: 2),
              ),
            );
          },
          backgroundColor: const Color(0xFF064E3B),
          foregroundColor: const Color(0xFFA7F3D0),
          borderRadius: 12.0,
          border: const BorderSide(color: Color(0xFF10B981), width: 1.5),
          elevation: 2.0,
        ),

        // 3. Bouton Contour Épuré (Outline Pill)
        CustomButton(
          text: 'En savoir plus',
          icon: const Icon(Icons.arrow_forward, size: 18),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('ℹ️ Redirection vers la documentation.'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: const Color(0xFFE2E8F0),
          borderRadius: 30.0,
          border: BorderSide(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1.5,
          ),
          elevation: 0.0,
        ),
      ],
    );
  }
}
