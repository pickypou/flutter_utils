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

```dart
 import 'package:flutter/material.dart';
 import 'package:flutter_utils/flutter_utils.dart';
 
 void main() {
 ThemeConfig.primaryColo = Colors.green;
 ThemeConfig.secondaryColor = Colors. red;
 ThemeConfig.textColor = Colors.black;
 ThemeConfig.fontFamily = 'Roboto';
 
 runApp(const MyApp());
 }
 
 class MyApp extends StatelessWidget {
    const MyApp({super.key});
    
    @override
    Widget build(BuildContext context) {
    title: 'example flutter_utils';
    theme: appTheme(context);
    home: const MyHomePage();
    }
 }
```
2.**Champ de saisie Personnalisé**
Vous pouvez créer un champ de saisie personnalisé en quelque ligne de code:
```dart
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
      ),
    );
  }
}
```

3.**Carousel d'images**
implantez un simple carousel d'images dans votre application : 

```dart
import 'package :flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ExampleImageCarousel extends StatelessWidget {
  const ExampleImageCarousel({super.key});
  
  @override
Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/img1.png',
      'assets/images/img2.png',
      'assets/images/img3.png'
    ];
    return Scafold(
      body: Center(
        child: ImageCarousel(
          images: images,
          height: 200.0,
          wviewportFraction: 0.8,
          autoPlay: true,
        )
      )
    );
  }
 }
```
**Projet Exemple**
Pour plus d'exemples, consultez le répertoire [example(https://chatgpt.com/c/a68dae08-a5f9-40e8-9893-b2b775857346)] dans le dépôt. Vous pouvez exécuter le projet exemple pour voir tous les composants en action.

**Contribution**

Les contribution sont les bien venues! Si vous trouvez un bug ou avez une suggestion de fonctionnalitté, n'hésitez pas à créé une issue ou à soumettre une pull request.

**Licence**
Ce projet est sous licence MIT. Voir le fichier [LICENCE(https://github.com/pickypou/flutter_utils/blob/main/LICENSE)] pour plus de détails.