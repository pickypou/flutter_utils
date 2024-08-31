import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

import 'animation/ExampleAnimation.dart';

void main() {
  // configure les valeur de théme pout le projet
  ThemeConfig.primaryColor = Colors.green;
  ThemeConfig.secondaryColor = Colors.red;
  ThemeConfig.textColor = Colors.blue;
  ThemeConfig.fontFamily = 'Lora'; // Changer la police ici
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explication pour flutter-utils',
      theme: appTheme(context),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Comment me servir de futter_utils', style: ThemeConfig.titleStyleMedium(context),
          ),
           const SizedBox(height: 50,),
           ExampleAnimation(),
        ],
      ),
    );

  
  }
}
