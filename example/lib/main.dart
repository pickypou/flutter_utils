import 'package:flutter/material.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';
import 'package:example/animation/example_animation.dart';
import 'package:example/example_svg_custom_painter/example_svg_custom_painter.dart';
import 'package:example/widget/example_custom_button/example_custom_button.dart';
import 'package:example/widget/example_custom_text_field/example_custom_text_field.dart';
import 'package:example/widget/example_image_carousel/example_image_carousel.dart';
import 'package:example/widget/showcase_card.dart';

void main() {
  // Configuration moderne et cohérente du thème global
  ThemeConfig.primaryColor = const Color(0xFF6366F1); // Indigo vibrant
  ThemeConfig.secondaryColor = Colors.white; // Titres nets et clairs
  ThemeConfig.textColor = const Color(0xFF94A3B8); // Slate 400
  ThemeConfig.fontFamily = 'Inter';

  runApp(const MyApp());
}

/// Main application widget.
class MyApp extends StatelessWidget {
  /// Creates the [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Kit Utils - Vitrine Interactive',
      theme: appTheme(context).copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Soft Navy Slate 900
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF38BDF8),
          surface: Color(0xFF1E293B),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

/// The main showcase home page.
class MyHomePage extends StatelessWidget {
  /// Creates the [MyHomePage] widget.
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // 1. HERO HEADER
              _buildHeroHeader(context),
              const SizedBox(height: 32),

              // 2. SHOWCASE CARDS

              // Card A: SvgCustomPainter
              const ShowcaseCard(
                icon: Icons.chat_bubble_outline,
                title: 'Bulles BD & Nuages de Pensée',
                badge: 'SvgCustomPainter',
                description:
                    'Tracé vectoriel direct sur Canvas (zéro dépendance SVG externe) avec queue orientable et nuage de pensée authentique.',
                child: ExampleSvgCustomPainter(),
              ),

              // Card B: ImageCarousel
              const ShowcaseCard(
                icon: Icons.view_carousel_outlined,
                title: 'Carrousel d\'Images & Rognage Sélectif',
                badge: 'ImageCarousel & CropConfig',
                description:
                    'Carrousel fluide avec support d\'images distantes/locales et recadrage ciblé par image via CropConfig.',
                child: ExampleImageCarousel(),
              ),

              // Card C: Animations
              const ShowcaseCard(
                icon: Icons.auto_awesome_motion_outlined,
                title: 'Animations de Transition & Fondu',
                badge: 'ImageSlider & AnimatedOpacityFade',
                description:
                    'Transitions automatiques avec courbes fluides et composant de fondu d\'opacité configurable.',
                child: ExampleAnimation(),
              ),

              // Card D: CustomButton
              const ShowcaseCard(
                icon: Icons.smart_button_outlined,
                title: 'Boutons UI Épurés & Rétroaction',
                badge: 'CustomButton',
                description:
                    'Boutons pré-stylisés avec gestion des icônes, bordures, élévations et rayons de courbure.',
                child: ExampleCustomButton(),
              ),

              // Card E: CustomTextField
              const ShowcaseCard(
                icon: Icons.edit_note_outlined,
                title: 'Champs de Saisie Prêts à l\'Emploi',
                badge: 'CustomTextField',
                description:
                    'Formulaires épurés avec icônes de préfixe/suffixe, coins arrondis et gestion du texte masqué.',
                child: ExampleCustomTextField(),
              ),

              // Card F: Responsive & Orientation
              _buildResponsiveSection(context),

              const SizedBox(height: 48),

              // 3. FREELANCE FOOTER
              _buildFooter(context),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroHeader(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 860),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Version badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: const Color(0xFF6366F1).withValues(alpha: 0.4),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified, size: 16, color: Color(0xFF818CF8)),
                SizedBox(width: 8),
                Text(
                  'flutter_kit_utils v0.1.0 • Score 160/160 pub.dev',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA5B4FC),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Main Title
          const Text(
            'Comment me servir de flutter_kit_utils',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -0.8,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // Subtitle
          const Text(
            'Vitrine interactive des composants graphiques, animations et utilitaires conçus pour accélérer vos applications Flutter.',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF94A3B8),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Feature Badges
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              _buildBadge(Icons.palette_outlined, 'Canvas Vectoriel BD'),
              _buildBadge(Icons.crop, 'Rognage d\'Image Fin'),
              _buildBadge(Icons.animation, 'Animations Fluides'),
              _buildBadge(Icons.devices, 'Adaptatif & Responsive'),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF38BDF8)),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFFE2E8F0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveSection(BuildContext context) {
    return ShowcaseCard(
      icon: Icons.screen_rotation_outlined,
      title: 'Utilitaires d\'Orientation & Responsive',
      badge: 'OrientationStack & SizeExtensions',
      description:
          'Détection automatique paysage / portrait avec basculement dynamique du layout (Row en paysage, Column en portrait).',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > 500;
          return OrientationStack(
            orientation: isLandscape
                ? SizeOrientation.landscape
                : SizeOrientation.portrait,
            children: [
              Expanded(
                flex: isLandscape ? 1 : 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.devices, color: Color(0xFF38BDF8), size: 28),
                      SizedBox(height: 8),
                      Text(
                        'Orientation Adaptative',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'S\'adapte automatiquement selon l\'écran',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: isLandscape ? 1 : 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.speed, color: Color(0xFF10B981), size: 28),
                      SizedBox(height: 8),
                      Text(
                        'Extensions de Taille',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'size.orientation() et size.max()',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 860),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1E293B),
            const Color(0xFF1E1B4B).withValues(alpha: 0.8), // Deep Indigo
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF6366F1).withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.15),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.work_outline, color: Color(0xFFA5B4FC), size: 22),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Disponible pour vos projets Flutter Freelance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Création d\'applications iOS, Android & Web sur-mesure, composants graphiques avancés et sous-traitance.',
            style:
                TextStyle(fontSize: 13, color: Color(0xFF94A3B8), height: 1.4),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF334155)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.email_outlined,
                        size: 16, color: Color(0xFF38BDF8)),
                    SizedBox(width: 8),
                    Text(
                      'spysschaert.ludo@gmail.com',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF334155)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.code, size: 16, color: Color(0xFFA855F7)),
                    SizedBox(width: 8),
                    Text(
                      'github.com/pickypou',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
