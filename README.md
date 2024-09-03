3 # flutter_utils

'flutter_utils' est un package Flutter qui propose une collection de widgets réutilisables, d'animations et de fonctions utilitaires pour vous aider à simplifier votre processus de développement Flutter.

## Fonctionnalités

- **Widget Personnalisables** : inclut des champs de saisie personnalisés, des carousel d'image, et d'autre composant d'interface utilisateur réutilisables.
- **Gestion des Thèmes** : Permet de gérer et d'appliquer facilement des configurations de thème à travers votre application.
- **Animations** : une collection d'animation fluide et persinnalisables pour améliorer l'experiance utilisateur.

## Installation
 Ajoutez la ligne suivante dans votre fichier 'pubspec.yaml' sous 'dependencies' : 

```yaml
 dependencies:
   flutter_utils:
     git:
        url: https://github.com/pickypou/flutter_utils.git
        ref: main
```
Ensuite, exécutez la commande :

 flutter pub get
 
## Utilisation

1. **Configuration du Thème** :
Vous pouvez configure un thème global pour votre application en utilisant 'ThemeConfig'. Voici un exemple :

```flutter
 import 'package:flutter/material.dart';
 import 'package:flutter_utils/flutter_utils.dart';
 
 void main() {
 ThemeConfig.primaryColo = Colors.green;
 ThemeConfig.secondaryColor = Colors. red;
 ThemeConfig.textColor = Colors.black,
 ThemeConfig.fontFamily = 'Roboto',
 
 runApp(const MyApp());
 }
 
 class MyApp extends StatelessWidget {
    const MyApp({super.key});
    
    @override
    Widget build(BuildContext context) {
    title: 'example flutter_utils',
    thme: appTheme(context),
    home: const MyHomePage
    }
 }
```

