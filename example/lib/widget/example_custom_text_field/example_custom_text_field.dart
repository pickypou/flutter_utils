import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ExampleCustomTextField extends StatelessWidget {
  const ExampleCustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomTextField(
          hintText: 'Votre Nom',
          prefixIcon: const Icon(Icons.person),
    fillColor: ThemeConfig.primaryColor,
    textColor: ThemeConfig.secondaryColor,
    hintColor: Colors.blue,
    borderRadius: 12.0,
    fontSize: 18,
    keyboardType: TextInputType.text,
    obscureText: false,
      )
    );
  }
}
