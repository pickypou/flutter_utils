import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

import 'animations/animations_example.dart';

void main() {
  // configure les valeurs du thème pour cet exemple
  ThemeConfig.primaryColor = Colors.blue;
  ThemeConfig.secondaryColor = Colors.red;
  ThemeConfig.textColor = Colors.green;
  ThemeConfig.fontFamily = 'Lora';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Utils Example',
       theme: appTheme(context), // Utilisation direct de ThemeConfig
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
child:  SizedBox(
  height: 800,
  width: size.width,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Exemple d\'utilisation du packages ', style: ThemeConfig.titleStyleLarge(context),//Pour ThemeConfig
      ),
      const SizedBox(height: 30,),
      const AnimationExample(),
    ],
  ),
),
    );
  }
}