import 'package:flutter/material.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

/// Interactive showcase displaying modern configurations of [CustomTextField].
class ExampleCustomTextField extends StatelessWidget {
  /// Creates an [ExampleCustomTextField] showcase.
  const ExampleCustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Rechercher un composant ou un mot-clé...',
            prefixIcon: const Icon(Icons.search, color: Color(0xFF818CF8)),
            fillColor: const Color(0xFF0F172A), // Dark slate
            textColor: Colors.white,
            hintColor: const Color(0xFF64748B),
            borderColor: const Color(0xFF334155),
            borderRadius: 14.0,
            fontSize: 14,
            keyboardType: TextInputType.text,
            obscureText: false,
          ),
          const SizedBox(height: 14),
          CustomTextField(
            hintText: 'contact@votre-projet.com',
            prefixIcon:
                const Icon(Icons.email_outlined, color: Color(0xFF38BDF8)),
            fillColor: const Color(0xFF0F172A),
            textColor: Colors.white,
            hintColor: const Color(0xFF64748B),
            borderColor: const Color(0xFF334155),
            borderRadius: 14.0,
            fontSize: 14,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          const SizedBox(height: 14),
          CustomTextField(
            hintText: 'Mot de passe sécurisé',
            prefixIcon:
                const Icon(Icons.lock_outline, color: Color(0xFFA78BFA)),
            suffixIcon: const Icon(Icons.visibility_off,
                color: Color(0xFF64748B), size: 18),
            fillColor: const Color(0xFF0F172A),
            textColor: Colors.white,
            hintColor: const Color(0xFF64748B),
            borderColor: const Color(0xFF334155),
            borderRadius: 14.0,
            fontSize: 14,
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
