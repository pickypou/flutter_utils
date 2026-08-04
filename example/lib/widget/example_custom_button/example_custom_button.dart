import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ExampleCustomButton extends StatelessWidget {
  const ExampleCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Exemple CustomButton',
          style: ThemeConfig.titleStyleMedium(context),
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Bouton 100% Personnalisé',
          icon: const Icon(Icons.star),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bouton cliqué !')),
            );
          },
          width: 300,
          height: 60,
          backgroundColor: ThemeConfig.primaryColor,
          foregroundColor: ThemeConfig.secondaryColor,
          borderRadius: 30.0,
          elevation: 10.0,
          shadowColor: Colors.black45,
          border: BorderSide(
            color: ThemeConfig.secondaryColor,
            width: 2.0,
          ),
        ),
      ],
    );
  }
}
